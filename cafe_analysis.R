# ================================================
# CafeHub Loyalty Program Analysis
# Module 5 - Final Project
# ================================================

# ================================================
# Graded Challenge 1: Data Import & Cleaning
# (20 points)
# ================================================

# TODO: Import and clean data
# Requirements:
# 1. Import both CSV files
# 2. Print the data and view

### GRADED CHALLENGE 1 ###
# Import and prepare data
# Store in: customer_data, loyalty_data

# Recall that read.csv(file_name) is the function to import csv files into our programming environment.


# Import data files
customer_data <- read.csv("customer_data.csv")
loyalty_data <- read.csv("loyalty_data.csv")

# Print Customer Data
print(head(customer_data))

# Print Loyalty Data
print(head(loyalty_data))

# Check Customer Data Structure:
print(str(customer_data))
print(str(loyalty_data))  # Check structure

# ================================================
# Graded Challenge 2: Customer Analysis
# (40 points)
# ================================================

library(dplyr)
# TODO: Filter and Select Customer Data
# Requirements:
# Filter and Select Customer data:
# - Filter Customer Data for Age > 30. Store in variable Above_30
# - Select for Female customers who bought Smoothies in df_filtered
# YOUR CODE HERE
Above_30 <- customer_data %>% filter(Age > 30)
print(head(Above_30))

# Filter Data for Female customers who bought Smoothies. Save in df_filtered
# YOUR CODE HERE
df_filtered <- customer_data %>% filter(Product == "Smoothie" &
                                          Gender == "Female")
print(head(df_filtered))

# From df_filtered, select the Age and Product columns. Store in df_selected
# YOUR CODE HERE
df_selected <- df_filtered %>% select(Age, Product)
print(head(df_selected))

# ================================================
# Graded Challenge 3: Loyalty Program Analysis
# (20 points)
# ================================================

# TODO: Analyze loyalty tiers
# Requirements:
# 1. Categorize customers into tiers

### GRADED CHALLENGE 3 ###
# Create loyalty tier analysis based on the below point values:
# Gold >= 500 points
# Silver >= 200 points
# Bronze under 200 points
# Add "Tier" column to loyalty_data

# YOUR CODE HERE
loyalty_data <- loyalty_data %>% mutate(Tier = case_when(
  LoyaltyPoints < 200 ~ "Bronze",
  LoyaltyPoints >= 200 ~  "Silver",
  TRUE ~ "Gold"
))

# ================================================
# Graded Challenge 4: Report Generation
# (20 points)
# ================================================

# TODO: Generate comprehensive report
# Requirements:
# 1. Generate a report.

### GRADED CHALLENGE 4 ###
# Generate and save report
# Save df_selected to 'revised_customer_data.csv' and loyalty_data to revised_loyalty_data.csv

write.csv(df_selected, "revised_customer_data.csv", row.names = FALSE)
write.csv(loyalty_data, "revised_loyalty_data.csv", row.names = FALSE)


# ================================================
# Hints and Tips
# ================================================
# 1. Use as.Date() for date conversion
# 2. write() for saving reports
