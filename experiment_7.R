library(ggplot2)
library(dplyr)

df <- data.frame(
  customer_id = 1:10,
  age = c(22, 35, 42, 28, 55, 31, 24, 60, 48, 38),
  gender = c("F", "M", "M", "F", "F", "M", "F", "M", "F", "M"),
  age_group = c("18-29", "30-44", "30-44", "18-29", "45+", "30-44", "18-29", "45+", "45+", "30-44")
)

ggplot(df, aes(x = age_group)) +
  geom_bar(fill = "#1f77b4") +
  labs(title = "Distribution of Customer Ages", x = "Age Group", y = "Number of Customers") +
  theme_minimal()

df_pie <- df %>% 
  count(age_group)

ggplot(df_pie, aes(x = "", y = n, fill = age_group)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Customer Age Distribution", fill = "Age Group") +
  theme_void()

knitr::kable(
  df, 
  col.names = c("Customer ID", "Age", "Gender", "Age Group"),
  caption = "Customer Demographic Information"
)