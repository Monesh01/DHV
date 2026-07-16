data <- data.frame(
  CustomerID = c(1,2,3,4,5),
  Age = c(25,30,35,28,40),
  Satisfaction = c(4,5,3,4,5)
)

hist(data$Age,
     main = "Distribution of Customer Ages",
     xlab = "Age",
     ylab = "Frequency",
     col = "skyblue")

pie(table(data$Satisfaction),
    labels = names(table(data$Satisfaction)),
    main = "Customer Satisfaction Scores")

data$AgeGroup <- cut(data$Age,
                     breaks = c(20,30,40),
                     labels = c("21-30","31-40"),
                     include.lowest = TRUE)

barplot(table(data$AgeGroup, data$Satisfaction),
        main = "Satisfaction by Age Group",
        xlab = "Age Group",
        ylab = "Number of Customers",
        col = c("orange","lightgreen","skyblue"),
        legend = TRUE)


library(wordcloud2)

feedback_words <- c(
  "fast", "excellent", "slow", "great", "terrible", 
  "fast", "great", "excellent", "helpful", "slow", 
  "great", "unhelpful", "excellent", "fast", "great"
)


word_counts <- as.data.frame(table(feedback_words))
#dev.off()

wordcloud2(word_counts)