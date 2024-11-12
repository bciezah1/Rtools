data <- read.table('C:/Users/bciez/Documents/Basilio/Columbia_University/gwas/MEGA_MERGE/single_imputation/gene_base/double_imputation/gene_base_chr21.txt',header=TRUE)
head(data)

library(ggplot2)

# Example p-values
p_values <- data$PVAL  # Replace this with your actual p-values

# Prepare data for plotting
observed <- -log10(sort(p_values))
expected <- -log10(ppoints(length(p_values)))
qq_data <- data.frame(expected = expected, observed = observed)

# Create QQ plot
ggplot(qq_data, aes(x = expected, y = observed)) +
  geom_point(color = "blue", size = 1.5) +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(x = "Expected -log10(p-value)", y = "Observed -log10(p-value)") +
  ggtitle("QQ Plot") +
  theme_minimal()
