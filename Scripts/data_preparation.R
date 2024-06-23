# Loading the tidyverse package
library(tidyverse)

# loading the data set
data <- read.csv("../data/raw/covid_worldwide.csv")

# display data
head(data)

# summary of the data
summary(data)

#checking for missing values
colSums(is.na(data))

# Rename columns to be R-friendly
colnames(data) <- make.names(colnames(data))

# To handle missing values
data_clean <- data %>%
  drop_na() %>% 
  distinct()

# saving the cleaned data
write.csv(data_clean, "../data/processed/cleaned_data.csv", row.names = FALSE)

