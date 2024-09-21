install.packages("tidygeocoder")
library(tidygeocoder)
library(dplyr)

df <- read.csv("/Users/cherylynyong/Downloads/hies_district.csv", header = TRUE)
View(df)

df <- df %>%
  geocode(district, method = 'osm', lat = latitude, long = longitude)
          
# Output the result
View(df)

lat_min <- 0.92
lat_max <- 7.52
long_min <- 99.65
long_max <- 119.27

# Filter the dataframe to keep only rows within the geographic bounds of Malaysia
df_filtered <- df[df$latitude >= lat_min & df$latitude <= lat_max & 
                    df$longitude >= long_min & df$longitude <= long_max, ]

# View the filtered dataframe
View(df_filtered)

df_filtered <- na.omit(df_filtered)

household_income <- as.data.frame(df_filtered)
write.csv(household_income, "/Users/cherylynyong/Library/CloudStorage/OneDrive-MonashUniversity/Y3S2 FIT3179/FIT3179/w9-homework/data/cleaned_household_income.csv", row.names=FALSE)

