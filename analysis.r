
getwd()
setwd("C:/Users/hp/Desktop/AMS-Transcriptomics-Analysis")
list.files("GSE52209_series_matrix.txt")
data <- read.table(file.choose(),
                   header = TRUE,
                   sep = "\t",
                   comment.char = "!",
                   quote = "",
                   fill = TRUE)
head(data)
head(data)
dim(data)
colnames(data)[1:10]

# Set gene names as row names
rownames(data) <- data$ID_REF

# Remove ID column
data <- data[, -1]

# Convert to numeric (important)
data <- as.data.frame(lapply(data, as.numeric))

# Check again
head(data)

control <- data[, 1:14]
treated <- data[, 15:28]

# Calculate mean expression
control_mean <- rowMeans(control, na.rm = TRUE)
treated_mean <- rowMeans(treated, na.rm = TRUE)

# Log fold change
logFC <- log2(treated_mean + 1) - log2(control_mean + 1)

# Combine into dataframe
results <- data.frame(
  Gene = rownames(data),
  logFC = logFC
)

head(results)

upregulated <- subset(results, logFC > 1)
downregulated <- subset(results, logFC < -1)

# Check counts
nrow(upregulated)
nrow(downregulated)

write.csv(upregulated, "results/upregulated.csv", row.names = FALSE)
write.csv(downregulated, "results/downregulated.csv", row.names = FALSE)

library(ggplot2)

ggplot(results, aes(x = logFC)) +
  geom_histogram(bins = 50) +
  ggtitle("Log Fold Change Distribution") +
  xlab("logFC") +
  ylab("Gene Count")

install.packages("pheatmap")

library(pheatmap)

# Order by highest absolute change
top_genes <- results[order(abs(results$logFC), decreasing = TRUE), ]

# Take top 50
top50 <- top_genes[1:50, ]

# Extract expression data
heatmap_data <- data[top50$Gene, ]
pheatmap(heatmap_data,
         scale = "row",
         show_rownames = FALSE,
         main = "Top 50 Differentially Expressed Genes")

png("results/heatmap.png", width = 800, height = 600)

pheatmap(heatmap_data,
         scale = "row",
         show_rownames = FALSE,
         main = "Top 50 Differentially Expressed Genes")

dev.off()

summary(results$logFC)