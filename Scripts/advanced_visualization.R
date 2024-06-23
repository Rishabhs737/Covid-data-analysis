# load the package
library(tidyverse)

# load the data set
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

# Convert Population to numeric if necessary
top10_population$Population <- as.numeric(gsub(",", "", top10_population$Population))

# Bubble chart Total cases v/s total Deaths, sized by population of top 10 countries
ggplot(top10_population, aes(x = Total.Cases, y = Total.Deaths, size = Population, color = Country)) + 
  geom_point(alpha = 0.7) +
  theme_minimal() + 
  labs(title = "Total cases V/s Total Deaths(sized by population)", x = "Total Cases", y= "Total Deaths")

# save the plot
ggsave("../output/plots/total_cases_vs_total_deaths_bubble_plot.png")

# Convert Total.Recovered to numeric if necessary
top10_population$Total.Recovered <- as.numeric(gsub(",", "", top10_population$Total.Recovered))

# Convert Active.Cases to numeric if necessary
top10_population$Active.Cases <- as.numeric(gsub(",", "", top10_population$Active.Cases))

# Convert Total.Test to numeric if necessary
top10_population$Total.Test <- as.numeric(gsub(",", "", top10_population$Total.Test))

# scatter plot matrix
pairs(~Total.Cases + Total.Deaths + Total.Recovered + Active.Cases + Total.Test + Population, data = top10_population,
      main = "scatter plot matrix")

# save 
ggsave("../output/plots/scatter_plot_matrix.png")
