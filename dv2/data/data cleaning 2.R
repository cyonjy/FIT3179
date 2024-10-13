data = read.csv("/Users/cherylynyong/Library/CloudStorage/OneDrive-MonashUniversity/Y3S2 FIT3179/FIT3179/dv2/data/hh_income_state.csv")
View(data)

# Load the dplyr package
library(dplyr)

# Assuming your data frame is called 'data'
# Convert the date column to Date format and filter rows where date is after 1976-01-01
data_filtered <- data %>%
  filter(as.Date(date) >= as.Date("1976-01-01"))

# View the filtered data
View(data_filtered)


data_filtered <- na.omit(data_filtered)

household_income_state <- as.data.frame(data_filtered)
write.csv(household_income_state, "/Users/cherylynyong/Library/CloudStorage/OneDrive-MonashUniversity/Y3S2 FIT3179/FIT3179/dv2/data/cleaned_household_income_state.csv", row.names=FALSE)

