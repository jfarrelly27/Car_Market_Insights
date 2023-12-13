# Car_Market_Insights
**Car Data Collection, Analysis and Insights about the US car market, including price trends, recalls, brand popularity. etc.**
This project aims to analyze various aspects of the automotive market in the United States, focusing on price trends, the impact of mileage on vehicle prices, the popularity of car brands, and the frequency of recalls. The analysis provides insights into the dynamics of the car market, crucial for consumers, manufacturers, and market researchers.

---
## Data Source

The data for this project is sourced from two primary datasets:

1. **USA Car Dataset (Kaggle)**: A comprehensive dataset containing details about cars sold in the USA, including make, model, year, price, mileage, and other specifications.
   
   - **Data Source**: [Kaggle - USA Cars Dataset](https://www.kaggle.com/datasets/abhishekbagwan/usa-cars-datasets)

2. **NHTSA vPIC API**: A database from the United States Department of Transportation providing extensive vehicle specifications, including recall information.

   - **Data Source**: [NHTSA vPIC API](https://vpic.nhtsa.dot.gov/api/)

## Current Status of Data

- **Last Updated**: December 2023
- The dataset includes data up to December 8, 2023.
- All entries have undergone initial consistency checks. Full authentication of each entry is ongoing.

## Data Dictionary

| Column Name   | Description |
|---------------|-------------|
| `Brand`       | The make or manufacturer of the car. |
| `Model`       | The specific model of the car. |
| `Year`        | The year the car was manufactured. |
| `Price`       | The listing or selling price of the car. |
| `Mileage`     | The total distance the car has been driven, in miles. |
| `Color`       | The exterior color of the car. |
| `Title Status`| The legal status of the car's title. |
| `VIN`         | The unique Vehicle Identification Number. |
| `State`       | The US state where the car was sold. |
| `Condition`   | The condition of the car at the time of listing. |
| `Recall`      | Indicates if the car has been subject to a recall (Y/N). |

## Changelog

- **11/08/2023 - 12/08/2023**: Initiated and completed the majority of the project - set up the basic structure for the analysis.

## Notes

- Update the data dictionary as new columns are added.
- Assess the impact of recalls on car brand reputation.
- Explore discrepancies in prices based on various factors.

## Business Analytics & Information Systems - Professional Preparation
Per guidelines from courses in the Tippie College of Business at the University of Iowa, this project includes:

- Professional documentation of data sources and methodologies.
- Ethical considerations in data scraping, handling, and analysis.
- A focus on providing clear insights from the data analysis.
