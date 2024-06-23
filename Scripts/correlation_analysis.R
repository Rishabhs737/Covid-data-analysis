# load the packages
library(tidyverse)
library(ggcorrplot)

# load the data set
data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Convert columns to numeric
data_clean <- data_clean %>% 
  mutate(across(where(is.character), ~as.numeric(gsub(",", "", .))))

# correlation matrix
cor_matrix <- data_clean %>%
  select(Total.Cases, Total.Deaths, Total.Recovered, Active.Cases, Total.Test, Population) %>%
  cor(use = "complete.obs")

# plot the correlation matrix
ggcorrplot(cor_matrix, method = "circle", type = "lower", lab = TRUE)

# save

ggsave("../output/plots/correlation_matrix.png")
