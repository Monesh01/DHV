library(ggplot2)

# 1. Dataset Setup
df <- data.frame(
  product_name = c("Product A", "Product B", "Product C", "Product D", "Product E"),
  quantity = c(250, 175, 300, 200, 220),
  price = c(50, 85, 30, 65, 40)
)

ggplot(df, aes(x = reorder(product_name, -quantity), y = quantity)) +
  geom_col(fill = "skyblue", color = "black") +
  geom_text(aes(label = quantity), vjust = -0.5) +
  labs(
    title = "1. Inventory Quantity by Product", 
    x = "Product Name", 
    y = "Quantity Available"
  ) +
  theme_minimal()

df_stacked <- data.frame(
  product_name = rep(df$product_name, 2),
  location = c(rep("Warehouse 1", 5), rep("Warehouse 2", 5)),
  quantity = c(df$quantity * 0.6, df$quantity * 0.4)
)

ggplot(df_stacked, aes(x = product_name, y = quantity, fill = location)) +
  geom_col() +
  labs(
    title = "2. Stacked Inventory Distribution Across Warehouses", 
    x = "Product Name", 
    y = "Quantity Available",
    fill = "Location"
  ) +
  scale_fill_manual(values = c("Warehouse 1" = "#4C72B0", "Warehouse 2" = "#55A868")) +
  theme_minimal()

ggplot(df, aes(x = price, y = quantity, label = product_name)) +
  geom_point(color = "#DC143C", size = 4) +  # Used hex code for crimson
  geom_text(vjust = -1, size = 3.5) +
  labs(
    title = "3. Product Price vs Quantity Available", 
    x = "Price ($)", 
    y = "Quantity Available"
  ) +
  theme_minimal()