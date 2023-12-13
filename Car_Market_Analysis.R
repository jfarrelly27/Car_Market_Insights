# James Farrelly

rm(list=ls())

# Load necessary libraries
library(httr)
library(jsonlite)
library(dplyr)
library(ggplot2)
library(writexl)

# Define the years we're interested in for data collection
years <- c(1973:2020)

# Initialize empty dataframe for recall data
recall_data <- data.frame(modelYear = integer(), Make = character(), stringsAsFactors = FALSE)

# Fetch recall data for each year
for (year in years) {
  api_url <- paste0("https://api.nhtsa.gov/products/vehicle/makes?modelYear=", year, "&issueType=r")
  response <- GET(api_url)
  
  if (status_code(response) == 200) {
    year_data <- fromJSON(rawToChar(response$content), flatten = TRUE)
    if (!is.null(year_data$results)) {
      year_recalls <- data.frame(modelYear = year, Make = tolower(year_data$results$make))
      recall_data <- rbind(recall_data, year_recalls)
    }
  } else {
    print(paste("Error fetching recall data for modelYear:", year))
  }
}

# Load and preprocess the usa_cars dataset
usa_cars <- read.csv("USA_cars_datasets.csv")
usa_cars <- usa_cars %>%
  mutate(model = tolower(model),
         brand = tolower(brand),
         Recall = ifelse(model %in% recall_data$Make & year %in% recall_data$modelYear, 'Yes', 'No'))

# Research Question 1: Average Car Price by Year
average_price_by_year <- usa_cars %>%
  group_by(year) %>%
  summarise(average_price = mean(price, na.rm = TRUE))
print("Average Car Price by Year:")
print(average_price_by_year)

# Visualization for RQ1
ggplot(average_price_by_year, aes(x = year, y = average_price)) +
  geom_line() +
  theme_minimal() +
  labs(title = "Average Car Price by Year", x = "Year", y = "Average Price")

# Research Question 2: Correlation Between Mileage and Price
correlation_mileage_price <- cor.test(usa_cars$mileage, usa_cars$price, method = "pearson")
print("Correlation Between Mileage and Price:")
print(correlation_mileage_price)

# Visualization for RQ2
ggplot(usa_cars, aes(x = mileage, y = price)) +
  geom_point(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Correlation between Mileage and Price", x = "Mileage", y = "Price")

# Research Question 3: Most Common Car Brand
most_common_brand <- usa_cars %>%
  group_by(brand) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  slice(1)
print("Most Common Car Brand:")
print(most_common_brand)

# Visualization for RQ3
ggplot(usa_cars, aes(x = brand, fill = brand)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Most Common Car Brand", x = "Brand", y = "Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Research Question 4: Number of Recalled Cars by Brand

# Filtering recalled cars
recalled_cars <- usa_cars %>%
  filter(Recall == 'Yes')

# Counting the number of recalled models per brand
recall_count_by_brand <- recalled_cars %>%
  group_by(brand) %>%
  summarise(recall_count = n()) %>%
  arrange(desc(recall_count))

# Printing the result
print("Number of Recalled Cars by Brand:")
print(recall_count_by_brand)

# Visualization for RQ4
ggplot(recall_count_by_brand, aes(x = reorder(brand, -recall_count), y = recall_count, fill = brand)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Number of Recalled Cars by Brand", x = "Brand", y = "Recall Count") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


