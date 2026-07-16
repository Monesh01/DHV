library(ggplot2)
library(dplyr)
library(tidyr)

# Data
df <- data.frame(
  date = as.Date(paste0('2023-01-0', 1:5)),
  views = c(1500, 1600, 1400, 1650, 1800),
  ctr = c(2.3, 2.7, 2.0, 2.4, 2.6),
  Likes = c(120, 150, 110, 170, 210),
  Comments = c(45, 60, 35, 55, 80),
  Shares = c(25, 35, 20, 30, 45)
)

# 1. Line Chart: Daily Page Viewers
ggplot(df, aes(date, views)) +
  geom_line(color = "blue") + geom_point(color = "red") +
  geom_text(aes(label = views), vjust = -1) +
  labs(title = "Daily Page Viewers Trend", x = "Date", y = "Page Viewers") +
  theme_minimal()

# 2. Bar Chart: Top 3 Days by CTR
df %>% slice_max(ctr, n = 3) %>%
  ggplot(aes(reorder(as.character(date), ctr), ctr)) +
  geom_col(fill = "green", width = 0.6) + coord_flip() +
  geom_text(aes(label = paste0(ctr, "%"))) +
  labs(title = "Top 3 Days by CTR", x = "Date", y = "CTR (%)") +
  theme_minimal()

df %>% 
  pivot_longer(Likes:Shares, names_to = "Type", values_to = "Count") %>%
  ggplot(aes(date, Count, fill = Type)) +
  geom_area(alpha = 0.8) +
  labs(title = "User Interactions", x = "Date", y = "Total Interactions") +
  theme_minimal()