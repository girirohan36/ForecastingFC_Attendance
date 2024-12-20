
library(tidyverse)
library(lubridate)

dynamos_data <- read.csv("/Users/maggiekleman/Desktop/MSBA/Supply Chain/dynamo_games_initial (1).csv")

# Add Year to Dates dates where it is missing
dynamos_data <- dynamos_data %>%
  mutate(Date = if_else(str_detect(Date, as.character(Year)), Date, paste(Date, Year)))

# Convert to date format
dynamos_data <- dynamos_data %>%
  mutate(FullDate = as.Date(Date, format = "%A %B %d %Y"))


# Verify the Processed Data
print(dynamos_data %>% select(FullDate, Attendance))

# Plot Attendance Over Time
ggplot(dynamos_data, aes(x = FullDate, y = Attendance)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(
    title = "Attendance Over Time",
    x = "Date",
    y = "Attendance"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Average Monthly Attendance 
dynamos_data %>%
  mutate(Month = floor_date(FullDate, "month")) %>%
  group_by(Month) %>%
  summarize(MonthlyAttendance = mean(Attendance)) %>%
  ggplot(aes(x = Month, y = MonthlyAttendance)) +
  geom_line(color = "blue") +
  labs(title = "Monthly Attendance Trends", x = "Month", y = "Average Attendance")

# Average attendance by day of the week
dynamos_data %>%
  mutate(Weekday = wday(FullDate, label = TRUE)) %>%
  group_by(Weekday) %>%
  summarize(AverageAttendance = mean(Attendance)) %>%
  ggplot(aes(x = Weekday, y = AverageAttendance, fill = Weekday)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Attendance by Day of the Week", x = "Day", y = "Average Attendance")

# attendance distributions
ggplot(dynamos_data, aes(x = Attendance)) +
  geom_histogram(binwidth = 500, fill = "blue", color = "white") +
  labs(title = "Distribution of Attendance", x = "Attendance", y = "Frequency")

# attendance by match type 
dynamos_data %>%
  group_by(Competition) %>%
  summarize(AverageAttendance = mean(Attendance)) %>%
  ggplot(aes(x = Competition, y = AverageAttendance, fill = Competition)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Attendance by Competition", x = "Competition", y = "Average Attendance")

# Average Attendance by Opponent
dynamos_data %>%
  group_by(Opponent) %>%
  summarize(AverageAttendance = mean(Attendance)) %>%
  arrange(desc(AverageAttendance)) %>%
  ggplot(aes(x = reorder(Opponent, -AverageAttendance), y = AverageAttendance, fill = Opponent)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(
    title = "Average Attendance by Opponent",
    x = "Opponent",
    y = "Average Attendance"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  )


