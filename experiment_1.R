# Install packages (if not already installed)
# install.packages(c("ggplot2", "plotly"))

library(ggplot2)
library(plotly)


sales_data <- data.frame(
  Month = c("January", "February", "March", "April", "May"),
  Sales = c(15000, 18000, 22000, 20000, 23000)
)

 print(sales_data)

line_chart <- ggplot(sales_data, aes(x = Month, y = Sales, group = 1)) +
  geom_line(color = "blue", linewidth = 1.2) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Monthly Sales",
    x = "Month",
    y = "Sales ($)"
  ) +
  theme_minimal()

print(line_chart)



bar_chart <- ggplot(sales_data, aes(x = Month, y = Sales, fill = Month)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Monthly Sales Bar Chart",
    x = "Month",
    y = "Sales ($)"
  ) +
  theme_minimal()

print(bar_chart)




scatter_plot <- ggplot(sales_data, aes(x = Month, y = Sales)) +
  geom_point(color = "blue", size = 4) +
  labs(
    title = "Monthly Sales Scatter Plot",
    x = "Month",
    y = "Sales ($)"
  ) +
  theme_minimal()

print(scatter_plot)


p1 <- ggplotly(line_chart)
p2 <- ggplotly(bar_chart)

subplot(
  p1,
  p2,
  nrows = 1,
  titleX = TRUE,
  titleY = TRUE
)

