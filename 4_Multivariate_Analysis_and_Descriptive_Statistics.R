library(dplyr)
library(corrplot)
library(sentimentr)
library(stringi)
install.packages("corrplot")
install.packages("sentimentr")


#Creation of a new varibale Review.length + count.words
#####################################3



Review.length <- (str_length(data.full$Review.Text))
data.full2 <- cbind(data.full, Review.length)
data.full2 <- cbind(data.full2, Count.words)
data.full2$Class.Name <- as.factor(data.full2$Class.Name)
Count.words <- str_count(data.full$Review.Text,'\\w+')




dat3 <- data.full2 %>% select(Recommended.IND ,Rating , Age , Clothing.ID, Review.length , Positive.Feedback.Count, Count.words)





####  Coorelation Matrix


summary(dat3)



res <- cor(dat3)
res2 <- as.matrix(round(res, 2))


col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(res2, method="color", col=col(200),  
         order="hclust", 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=45, #Text label color and rotation
         # Combine with significance
          sig.level = 0.01, insig = "blank", 
         # hide correlation coefficient on the principal diagonal
         diag=TRUE 
)


#hEAT MAP SUGGESTS THAT THERE IS A CORREALTION BETWEEN RATING AND RECOMENDED PRODUCT lets look closer into that 



