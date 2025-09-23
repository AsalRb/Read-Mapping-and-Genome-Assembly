# Load required libraries
library(ShortRead)
library(ggplot2)

# Load the FASTQ file
fastq_file <- "C:/Users/Asal/Desktop/Project1/input_data/subset.fastq"
reads <- readFastq(fastq_file)

# Extract quality scores and read lengths
quality_scores <- quality(reads)
read_lengths <- width(reads)

# Box Plot of Quality Scores
# Convert quality scores to a data frame
qualities_df <- as.data.frame(as(quality_scores, "matrix"))
boxplot_data <- stack(qualities_df)

# Create the boxplot object
boxplot <- ggplot(boxplot_data, aes(x = ind, y = values)) +
  geom_boxplot(outlier.shape = NA) +
  theme_minimal() +
  labs(title = "Box Plot of Quality Scores", x = "Position in Read", y = "Quality Score")

# Save the boxplot to a PNG file
ggsave("C:/Users/Asal/Desktop/Project1/qc_results/quality_boxplot.png", plot = boxplot)

# Density Plot of Read Lengths
density_plot <- ggplot(data.frame(read_lengths), aes(x = read_lengths)) +
  geom_density(fill = "blue", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Density Plot of Read Lengths", x = "Read Length", y = "Density")

# Save the density plot to a PNG file
ggsave("C:/Users/Asal/Desktop/Project1/qc_results/read_length_density.png", plot = density_plot)

# Ensure the 'qc_results' directory exists, if not create it
if (!dir.exists("C:/Users/Asal/Desktop/Project1/qc_results/")) {
  dir.create("C:/Users/Asal/Desktop/Project1/qc_results/")
}
