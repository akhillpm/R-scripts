
#Data Import
setwd("")
data <- read.csv("abc.csv")

View(data)
colnames(data)

# Libraries
library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)

# sample size
sample_size = data %>% group_by(Region) %>% summarize(num=n())

# Plot
data %>%
  left_join(sample_size) %>% 
  mutate(myaxis = paste0(Region, "\n", "n=", num)) %>%
  ggplot( aes(x=myaxis, y=Metric.Tons.Per.Capita, fill=Region)) +
  geom_violin(width=1.4) +
  geom_boxplot(width=0.1, color="grey", alpha=0.2) +
  scale_fill_viridis(discrete = TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("A Violin wrapping a boxplot") +
  xlab("")

