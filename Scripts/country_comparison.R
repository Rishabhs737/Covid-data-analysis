# loading libraries
library(tidyverse)
library(lubridate)

# loading the data set
data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Convert Total.Cases to numeric if necessary
data_clean$Total.Cases <- as.numeric(gsub(",", "", data_clean$Total.Cases))

# Convert Total.Deaths to numeric if necessary
data_clean$Total.Deaths <- as.numeric(gsub(",", "", data_clean$Total.Deaths))

# calculate fatality rates
data_clean <- data_clean %>% 
  mutate(Case_Fatality_Rate = (Total.Deaths / Total.Cases) * 100)

# top 10 fatality rates
top10_fatality <- data_clean %>% 
  top_n(10, wt = Case_Fatality_Rate)

# plot
ggplot(top10_fatality, aes(x = reorder(Country, -Case_Fatality_Rate), y = Case_Fatality_Rate)) + 
  geom_bar(stat = "identity", fill = "red") + 
  theme_minimal() + 
  labs(title = "Top 10 countries by fatality rate", x = "Country", y = "Fatality Rate")

# save the plot
ggsave("../output/plots/top10_countries_by_fatality_rate.png")

# comparing test rate

# Convert Total.Cases to numeric if necessary
data_clean$Total.Test <- as.numeric(gsub(",", "", data_clean$Total.Test))

# Convert Total.Cases to numeric if necessary
data_clean$Population <- as.numeric(gsub(",", "", data_clean$Population))

data_clean <- data_clean %>% 
  mutate(Test_Rate = Total.Test / Population * 100)

top10_tests <- data_clean %>% 
  top_n(10, wt = Test_Rate)

# plot
ggplot(top10_tests, aes(x = reorder(Country, -Test_Rate), y = Test_Rate)) + 
  geom_bar(stat = "identity", fill = "green") +
  theme_minimal() +
  labs(title = "Top 10 countries by test rate", x = "Country", y = "Test Rate")

# save the plot
ggsave("../output/plots/top10_countries_by_test_rate.png")

