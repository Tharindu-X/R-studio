# Load raw data
raw_data <- read_csv("Global_YouTube_Statistics.csv")

# Show column names (just to check)
cat("Columns before cleaning:\n")
print(colnames(raw_data))
# Select only relevant columns
cleaned_data <- raw_data %>%
  select(
    rank,
    Youtuber,
    subscribers,
    `video views`,
    category,
    uploads,
    Country,
    channel_type,
    created_year,
    video_views_for_the_last_30_days,
    subscribers_for_last_30_days
  )
# Remove any duplicate channels (based on Youtuber name)
cleaned_data <- cleaned_data %>%
  distinct(Youtuber, .keep_all = TRUE)
# Remove rows with missing data (optional, depends on dataset quality)
cleaned_data <- cleaned_data %>%
  filter(complete.cases(.))
# Show what was done
cat("\nRows before cleaning:", nrow(raw_data), "\n")
cat("Rows after cleaning:", nrow(cleaned_data), "\n")
cat("Columns after cleaning:\n")
print(colnames(cleaned_data))
# Save the cleaned dataset
write_csv(cleaned_data, "Global_YouTube_Statistics_cleaned.csv")
