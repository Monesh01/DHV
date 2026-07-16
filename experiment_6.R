library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)
library(grid)      # Adds grid.newpage()


# ---------------------------------------------------------
# 1. Dataset Setup
# ---------------------------------------------------------
df <- data.frame(
  product_id = c(1, 2, 3),
  product_name = c("Product A", "Product B", "Product C"),
  January = c(2000, 1500, 1200),
  February = c(2200, 1800, 1400),
  March = c(2400, 1600, 1100)
)

# Reshape data into long format for ggplot
df_long <- df %>%
  pivot_longer(
    cols = January:March, 
    names_to = "Month", 
    values_to = "Sales"
  ) %>%
  mutate(Month = factor(Month, levels = c("January", "February", "March")))

# ---------------------------------------------------------
# 2. Grouped Bar Chart: Q1 Sales by Product
# ---------------------------------------------------------
p_bar <- ggplot(df_long, aes(x = Month, y = Sales, fill = product_name)) +
  geom_col(position = "dodge", width = 0.7) +
  geom_text(
    aes(label = scales::comma(Sales)), 
    position = position_dodge(width = 0.7), 
    vjust = -0.5, 
    size = 3.5, 
    fontface = "bold"
  ) +
  scale_fill_manual(values = c("Product A" = "#1f77b4", "Product B" = "#ff7f0e", "Product C" = "#2ca02c")) +
  scale_y_continuous(limits = c(0, 2800), labels = scales::comma) +
  labs(
    title = "Q1 Product Sales Comparison",
    x = "Month",
    y = "Sales ($)",
    fill = "Product"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 14))

print(p_bar)

# ---------------------------------------------------------
# 3. Stacked Area Chart: Overall Sales Trend
# ---------------------------------------------------------
p_area <- ggplot(df_long, aes(x = Month, y = Sales, fill = product_name, group = product_name)) +
  geom_area(alpha = 0.85, color = "white") +
  scale_fill_manual(values = c("Product A" = "#1f77b4", "Product B" = "#ff7f0e", "Product C" = "#2ca02c")) +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Overall Quarterly Sales Trend by Product",
    x = "Month",
    y = "Total Sales ($)",
    fill = "Product"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 14))

print(p_area)

# ---------------------------------------------------------
# 4. Table Graphic: Monthly Sales Data
# ---------------------------------------------------------
# Formatting table headers and column names
table_data <- df %>%
  rename(
    `Product ID` = product_id,
    `Product Name` = product_name,
    `Jan Sales` = January,
    `Feb Sales` = February,
    `Mar Sales` = March
  )

# Display as a plot graphic in the Plots panel
grid.newpage()
grid.table(table_data)