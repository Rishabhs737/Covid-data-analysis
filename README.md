# COVID-19 Data Analysis Project

## Project Overview
This project aims to analyze the worldwide COVID-19 data to understand trends and patterns in confirmed cases, recoveries, and deaths. The analysis includes exploratory data analysis, comparisons between countries, distribution analysis, correlation analysis, and advanced visualizations.

## Directory Structure

```r
│   README.md
│
├───data
│   ├───processed
│   │       cleaned_data.csv
│   │
│   └───raw
│           covid_worldwide.csv
│
├───output
│   └───plots
│           correlation_matrix.png
│           death_rate_bar_plot.png
│           distribution_total_cases.png
│           distribution_total_deaths.png
│           distribution_total_recovered.png
│           recovery_rate_bar_plot.png
│           scatter_plot_matrix.png
│           scatter_total_cases_vs_population.png
│           scatter_total_cases_vs_total_deaths.png
│           scatter_total_cases_vs_total_recovered.png
│           scatter_total_deaths_vs_population.png
│           test_rate_bar_plot.png
│           top10_countries_by_fatality_rate.png
│           top10_countries_by_test_rate.png
│           top10_countries_cases.png
│           total_cases_vs_total_deaths_bubble_plot.png
│
└───Scripts
        advanced_visualization.R
        correlation_analysis.R
        country_comparison.R
        data_preparation.R
        distribution_analysis.R
        exploratory_data_analysis.R
        percentage_metrics.R
        scatter_plots.R
```

## Data Source
The dataset used in this project is sourced from kaggle can be found here [Covid Cases and Deaths WorldWide](https://www.kaggle.com/datasets/themrityunjaypathak/covid-cases-and-deaths-worldwide?select=covid_worldwide.csv) by MRITYUNJAY PATHAK. It includes data on confirmed cases, deaths, recoveries, active cases, total tests conducted, and population for various countries.

## Technologies Used
The project was made using R and R studio(Desktop)

## Installation and Setup
To run the analysis, you need to have R and RStudio installed. Additionally, install the following R packages if they are not already installed:
```r
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
install.packages("lubridate")
install.packages("caret")
install.packages("ggcorrplot")
install.packages("rmarkdown")
```
## Dependencies
R version 4.1.0 or higher

Required packages: tidyverse, ggplot2, dplyr, readr, lubridate, caret, ggcorrplot, rmarkdown

## Author 
Rishabh Sharma

## Acknowledgements
The dataset used in this project is sourced from kaggle can be found here [Covid Cases and Deaths WorldWide](https://www.kaggle.com/datasets/themrityunjaypathak/covid-cases-and-deaths-worldwide?select=covid_worldwide.csv) by MRITYUNJAY PATHAK.

## License

This project is licensed under the GNU General Public License v3.0. You may obtain a copy of the License at

<https://www.gnu.org/licenses/gpl-3.0.en.html>