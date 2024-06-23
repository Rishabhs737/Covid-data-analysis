# load the packages
library(tidyverse)

# load the dat set
data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Convert Total.Cases to numeric if necessary
data_clean$Total.Cases <- as.numeric(gsub(",", "", data_clean$Total.Cases))

# Convert Total.Deaths to numeric if necessary
data_clean$Total.Deaths <- as.numeric(gsub(",", "", data_clean$Total.Deaths))

# Convert Total.Deaths to numeric if necessary
data_clean$Total.Recovered <- as.numeric(gsub(",", "", data_clean$Total.Recovered))

# scatter plot
ggplot(data_clean, aes(x = Total.Cases, y = Total.Deaths)) + 
  geom_point(color = "red") + 
  theme_minimal() + 
  labs(title = "Total cases V/S Total Deaths", x = "Total Cases", y = "Total Deaths")

ggsave("../output/plots/scatter_total_cases_vs_total_deaths.png")

# scatter plot 2
ggplot(data_clean, aes(x = Total.Cases, y = Total.Recovered)) + 
  geom_point(color = "green") +
  theme_minimal() + 
  labs(title = "Total cases V/s Total Recoverd ", x = "Total Cases", y = "Total Recovered")

ggsave("../output/plots/scatter_total_cases_vs_total_recovered.png")

# Convert Population to numeric if necessary
data_clean$Population <- as.numeric(gsub(",", "", data_clean$Population))

#scatter plot 3
ggplot(data_clean, aes(x = Population, y = Total.Cases)) + 
  geom_point(color = "blue") +
  theme_minimal() +
  labs(title = "Total cases V/S population", x = "Population", y = "Total cases")

ggsave("../output/plots/scatter_total_cases_vs_population.png")

# scatter plot 4

ggplot(data_clean, aes(x = Population, y = Total.Deaths)) +
  geom_point(color = "orange") + 
  theme_minimal() +
  labs(title = "Total Deaths V/S Population", x = "Population", y = "Total Cases")

ggsave("../output/plots/scatter_total_deaths_vs_population.png")
