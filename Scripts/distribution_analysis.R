# load packages
library(tidyverse)

data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Convert Total.Cases to numeric if necessary
data_clean$Total.Cases <- as.numeric(gsub(",", "", data_clean$Total.Cases))

# histogram of total cases
ggplot(data_clean, aes(x = Total.Cases)) + 
  geom_histogram(binwidth = 1000000, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Total Cases", x = "Total Cases", y = "Frequency")

ggsave("../output/plots/distribution_total_cases.png")

# Convert Total.Deaths to numeric if necessary
data_clean$Total.Deaths <- as.numeric(gsub(",", "", data_clean$Total.Deaths))

# histogram of total deaths
ggplot(data_clean, aes(x = Total.Deaths)) +
  geom_histogram(binwidth = 1000000, fill = "red", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of total Deaths", x = "Total Deaths", y = "Frequency")

ggsave("../output/plots/distribution_total_deaths.png")

# Convert Total.Deaths to numeric if necessary
data_clean$Total.Recovered <- as.numeric(gsub(",", "", data_clean$Total.Recovered))

# histogram of total recovered
ggplot(data_clean, aes(x = Total.Recovered)) +
  geom_histogram(binwidth = 1000000, fill = "green", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of total recovered", x = "Total recovered", y = "Frequency")

ggsave("../output/plots/distribution_total_recovered.png")



