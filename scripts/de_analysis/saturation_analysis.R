library(tidyverse)

# Load the featureCounts output
counts <- read.delim("C:/Users/josem/OneDrive/Documents/Genome Analysis/de_analysis/bwa_featurecounts_matrix.txt", comment.char = "#", row.names = 1, check.names = FALSE)
counts <- counts[, -c(1:5)]  # remove annotation metadata columns

# Define a function to subsample and count detected genes
saturation_curve <- function(sample_counts, sample_name, steps = 10, reps = 3, threshold = 1) {
  total_reads <- sum(sample_counts)
  fractions <- seq(0.1, 1.0, length.out = steps)
  
  df <- expand.grid(Fraction = fractions, Rep = 1:reps)
  df$DetectedGenes <- NA
  
  for (i in seq_len(nrow(df))) {
    frac <- df$Fraction[i]
    subsampled <- rmultinom(1, size = round(total_reads * frac), prob = sample_counts)
    df$DetectedGenes[i] <- sum(subsampled >= threshold)
  }
  
  df$Sample <- sample_name
  return(df)
}

# Apply it to all samples
saturation_data <- map_dfr(colnames(counts), function(sample) {
  saturation_curve(counts[[sample]], sample_name = sample)
})

# Create your SRR → strain mapping
strain_map <- c(
  SRR24516456 = "DV3",
  SRR24516457 = "DV3",
  SRR24516458 = "DV3",
  SRR24516459 = "HP126",
  SRR24516460 = "HP126",
  SRR24516461 = "HP126",
  SRR24516462 = "R7",
  SRR24516463 = "R7",
  SRR24516464 = "R7"
)

# Clean sample names
saturation_data$Sample <- saturation_data$Sample %>%
  basename() %>%                                # just get file name from path
  str_remove("_bwa.sorted.bam") %>%             # remove extension
  as.character()

# Map strain info
saturation_data$Sample <- paste0(saturation_data$Sample, " - ", strain_map[saturation_data$Sample])

# Replot
ggplot(saturation_data, aes(x = Fraction, y = DetectedGenes, color = Sample)) +
  geom_line(stat = "summary", fun = mean) +
  geom_ribbon(stat = "summary", fun.data = mean_se, aes(fill = Sample), alpha = 0.3) +
  labs(title = "Saturation Analysis", x = "Fraction of Reads", y = "Detected Genes") +
  theme_minimal()
