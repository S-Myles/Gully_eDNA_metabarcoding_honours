library(dplyr)
library(readr)
library(ggplot2)
library(reshape2)

in_silico_data <- read_csv("Summary_statistics.csv")[1:30,3:9]
class(in_silico_data[[1]])<-"double"

# Compute correlation matrix
cormat <- cor(in_silico_data)


# Get lower triangle of the correlation matrix
cormat[upper.tri(cormat)] <- NA

#Melt the correlation data and drop the rows with NAs
melted_cormat <- melt(cormat, na.rm = TRUE)

# Heatmap
ggplot(data = melted_cormat, aes(Var2, Var1, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 17, hjust = 1),
        axis.text.y = element_text(size = 17),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  coord_fixed()

ggsave("Pearson correlation matrix heatmap.png")
