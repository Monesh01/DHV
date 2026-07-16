library(ggplot2)

# Dataset
data <- data.frame(
  EmployeeID = c(1, 2, 3, 4, 5),
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  YearsOfService = c(5, 3, 7, 4, 2),
  PerformanceScore = c(85, 92, 78, 90, 76)
)

# 1. Line Chart
ggplot(data, aes(x = EmployeeID, y = PerformanceScore, color = 'performance')) + 
  geom_line(linewidth = 1.2) + 
  geom_point(color = 'red', size = 3)

# 2. Bar Chart (automatically counts departments!)
ggplot(data, aes(x = Department))+
  geom_bar()

# 3. Scatter Plot
ggplot(data, aes(x = YearsOfService, y = PerformanceScore)) + 
  geom_point(color = 'red', size = 3)