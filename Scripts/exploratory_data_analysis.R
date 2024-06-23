# Load required libraries
library(tidyverse)

# Load the cleaned dataset
data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Print column names to verify
print(colnames(data_clean))

# Convert Total.Cases to numeric if necessary
data_clean$Total.Cases <- as.numeric(gsub(",", "", data_clean$Total.Cases))

# Check for any issues during conversion
print(sum(is.na(data_clean$Total.Cases)))

# Summary statistics
print(summary(data_clean))

# Example visualizations
# Plotting confirmed cases for the top 10 countries
top10_countries <- data_clean %>% 
  top_n(10, wt = Total.Cases)

ggplot(top10_countries, aes(x = reorder(Country, -Total.Cases), y = Total.Cases)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(title = "Top 10 Countries by Total COVID-19 Cases", x = "Country", y = "Total Cases")

# Save the plot
ggsave("../output/plots/top10_countries_cases.png")
