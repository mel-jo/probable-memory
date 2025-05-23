# Install & load
if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager")
pkgs <- c("DESeq2","edgeR","apeglm","tidyverse","pheatmap", "ggrepel")
BiocManager::install(pkgs, ask=FALSE, update=FALSE)
lapply(pkgs, library, character.only=TRUE)

# Read data & define samples
counts <- read.delim(
  "C:/Users/josem/OneDrive/Documents/Genome Analysis/de_analysis/bwa_featurecounts_matrix.txt",
  comment.char="#", row.names=1, check.names=FALSE
)[, -c(1:5)]

colnames(counts) <- colnames(counts) %>%
  basename() %>%
  str_remove("_bwa.sorted.bam")

sample_ids <- c(
  "SRR24516458","SRR24516457","SRR24516456",   
  "SRR24516464","SRR24516463","SRR24516462"    
)
counts_sub <- counts[, sample_ids]

sample_info <- data.frame(
  row.names = sample_ids,
  condition = rep(c("DV3","R7"), each=3)
)

sample_info$condition <- factor(sample_info$condition,
                                levels = c("R7","DV3"))

# Unfiltered
dds_unf <- DESeqDataSetFromMatrix(counts_sub, sample_info, ~condition)
dds_unf <- DESeq(dds_unf)

res_unf_raw <- results(dds_unf)
res_unf_shr <- lfcShrink(
  dds_unf,
  coef = "condition_DV3_vs_R7",
  type = "apeglm"
)

sig_unf <- subset(res_unf_shr, padj < .05 & abs(log2FoldChange) >= 1)

cat("[Unfiltered] tested:", nrow(res_unf_shr),
    "| significant:", nrow(sig_unf), "\n")

# CPM-filtered DESeq2
dge <- DGEList(counts_sub)
keep <- rowSums(cpm(dge) > 1) >= 3
counts_filt <- counts_sub[keep, ]

dds_filt <- DESeqDataSetFromMatrix(counts_filt, sample_info, ~condition)
dds_filt <- DESeq(dds_filt)

res_filt_raw <- results(dds_filt)
res_filt_shr <- lfcShrink(
  dds_filt,
  coef = "condition_DV3_vs_R7",
  type = "apeglm"
)

sig_filt <- subset(res_filt_shr, padj < .05 & abs(log2FoldChange) >= 1)
cat("[Filtered]   tested:", nrow(res_filt_shr),
    "| significant:", nrow(sig_filt), "\n")

write.csv(
  as.data.frame(sig_filt) %>% rownames_to_column("gene_id"),
  "DE_DV3_vs_R7_filtered_significant.csv",
  row.names = FALSE
)

# plotting 
vsd <- vst(dds_filt, blind=FALSE)

# extract matrix & sample info
mat   <- assay(vsd)
meta  <- as.data.frame(colData(vsd))

# PCA plot

pcaData <- plotPCA(vsd, intgroup="condition", returnData=TRUE)
percentVar <- round(100 * attr(pcaData, "percentVar"))

ggplot(pcaData, aes(PC1, PC2, color=condition)) +
  geom_point(size=4) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) +
  theme_minimal() +
  ggtitle("PCA")

# Heatmap of top 30 DEGs

top30 <- res_filt_shr %>%
  as.data.frame() %>%
  rownames_to_column("gene") %>%
  filter(!is.na(padj)) %>%
  arrange(padj) %>%
  slice(1:30) %>%
  pull(gene)

mat30 <- mat[top30, ]
mat30_scaled <- t(scale(t(mat30)))

ann <- data.frame(condition = meta$condition)
rownames(ann) <- rownames(meta)

pheatmap(mat30_scaled,
         annotation_col = ann,
         cluster_rows    = TRUE,
         cluster_cols    = TRUE,
         show_rownames   = TRUE,
         fontsize_row    = 8,
         main            = "Top 30 DEGs Heatmap")

# Volcano plot

vol <- res_filt_shr %>%
  as.data.frame() %>%
  rownames_to_column("gene") %>%
  filter(!is.na(padj)) %>%
  mutate(
    status = case_when(
      padj < 0.05 & log2FoldChange >=  1 ~ "Up in DV3",
      padj < 0.05 & log2FoldChange <= -1 ~ "Down in DV3",
      TRUE                               ~ "Not Sig"
    )
  )

toLabel <- vol %>%
  filter(status != "Not Sig") %>%
  arrange(padj) %>%
  slice(1:10) %>%
  pull(gene)

ggplot(vol, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(aes(color = status), alpha = 0.7, size = 1.5) +
  scale_color_manual(
    values = c(
      "Up in DV3"   = "red3",
      "Down in DV3" = "blue3",
      "Not Sig"     = "grey70"
    )
  ) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "grey50") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "grey50") +
  geom_text_repel(
    data = vol %>% filter(gene %in% toLabel),
    aes(label = gene),
    size = 3,
    box.padding = 0.3
  ) +
  theme_minimal() +
  labs(
    title = "Volcano Plot: DV3 vs R7",
    x = "log2 Fold Change (DV3 / R7)",
    y = "-log10(padj)",
    color = "Expression\nStatus"
  )
