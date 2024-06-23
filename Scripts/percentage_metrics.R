# load the packages
library(tidyverse)

# load the data
data_clean <- read.csv("../data/processed/cleaned_data.csv")

# Convert Population to numeric if necessary
data_clean$Population <- as.numeric(gsub(",", "", data_clean$Population))


# get the top 10 most populated countries
top10_population <- data_clean %>% 
  top_n(10, wt = Population)

# Convert Total.Cases to numeric if necessary
top10_population$Total.Cases <- as.numeric(gsub(",", "", top10_population$Total.Cases))

# Convert Total.Deaths to numeric if necessary
top10_population$Total.Deaths <- as.numeric(gsub(",", "", top10_population$Total.Deaths))

# Convert Total.Deaths to numeric if necessary
top10_population$Total.Recovered <- as.numeric(gsub(",", "", top10_population$Total.Recovered))

# Convert Population to numeric if necessary
top10_population$Population <- as.numeric(gsub(",", "", top10_population$Population))

# Convert Population to numeric if necessary
top10_population$Total.Test <- as.numeric(gsub(",", "", top10_population$Total.Test))

# Calculate the percentage metrics
top10_population <- top10_population %>% 
  mutate(
    Recovery_Rate = Total.Recovered / Total.Cases * 100,
    Death_Rate = Total.Deaths / Total.Cases * 100,
    Test_rate = Total.Test / Population * 100
  )

# recovery rate plot
ggplot(top10_population, aes(x = reorder(Country, -Recovery_Rate), y = Recovery_Rate)) + 
  geom_bar(stat = "identity", fill = "green") + 
  theme_minimal() +
  labs(title = "Recovery rate by country", x = "Country", y = "Recovery rate")

# save the plot
ggsave("../output/plots/recovery_rate_bar_plot.png")

# death rate plot
ggplot(top10_population, aes(x = reorder(Country, -Death_Rate), y = Death_Rate)) + 
  geom_bar(stat = "identity", fill = "darkred") + 
  theme_minimal() +
  labs(title = "Death rate by country", x = "Country", y = "death rate")

# save the plot
ggsave("../output/plots/death_rate_bar_plot.png")


# test rate plot
ggplot(top10_population, aes(x = reorder(Country, -Test_rate), y = Test_rate)) +
  geom_bar(stat = "identity", fill = "darkblue") +
  theme_minimal() + 
  labs(title = "test rate by country", x ="country", y = "test rate")

# save the plot
ggsave("../output/plots/test_rate_bar_plot.png")

