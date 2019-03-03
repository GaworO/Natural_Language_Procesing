library(ggthemes)
library(stringr)
library(tidytext) 
library(grid)
library(extrafont)
library(tm)
library(tmap)
library(wordcloud2)
library(rattle)
library(ggplot2)  
library(reshape2)
library(dplyr)
library(topicmodels)
library(tidyverse)
library(tidytext)
library(topicmodels)
library(stringr)
library(dplyr)
library(ggplot2)
library(ngramrr)
library(reshape)
library(tm)
library(wordcloud)
library(reshape2)
library(RColorBrewer)
library(quanteda)
library(wesanderson)
library(gridExtra)
library(outliers)
library(ggExtra)

install.packages("outliers")
install.packages("wesanderson")
install.packages("gridExtra")

setwd("C:\\Users\\Ola\\Desktop\\ML2_projekt")
dat2 <- read.csv("Womens.csv", header=T, na.strings=c(""," ","NA"))
# dat3 <- dat2 %>% select(Age , Clothing.ID , Rating , Recommended.IND)


# newdata.Age <- as.data.frame(subset(dat3$Age,!(dat3$Age > quantile(dat3$Age, probs=c(.01, .99))[2] | dat3$Age < quantile(dat3$Age, probs=c(.01, .99))[1]) ))
# newdata.Cloathing.id <- as.data.frame(subset(dat3$Clothing.ID,!(dat3$Clothing.ID > quantile(dat3$Clothing.ID, probs=c(.01, .99))[2] | dat3$Clothing.ID < quantile(dat3$Clothing.ID, probs=c(.01, .99))[1]) ))
# newdata.Rating <- as.data.frame(subset(dat3$Rating,!(dat3$Rating > quantile(dat3$Rating, probs=c(.01, .99))[2] | dat3$Rating < quantile(dat3$Rating, probs=c(.01, .99))[1]) ))
# newdata.Recomended <- as.data.frame(subset(dat3$Recommended.IND,!(dat3$Recommended.IND > quantile(dat3$Recommended.IND, probs=c(.01, .99))[2] | dat3$Recommended.IND < quantile(dat3$Recommended.IND, probs=c(.01, .99))[1]) ) )
# 
# colnames(newdata.Age)[1] <- "Age"
# colnames(newdata.Cloathing.id)[1] <- "Cloathing"
# colnames(newdata.Rating)[1] <- "Rating"
# colnames(newdata.Recomended)[1] <- "Recomended"
# 
# data.out.outliers <- join_all(list(newdata.Age$Age , newdata.Cloathing.id$Cloathing , newdata.Rating$Rating , newdata.Recomended$Recomended), by = 'rn', type = 'full')
# 
# bp <- boxplot(dat3$Clothing.ID, outline = FALSE)
# bp


# missing.values <- sum(is.na(dat2))
# 
# data.full <- dat2[complete.cases(dat2),]
# head(data.full)
#Zaczê³abym od boxplotów 

data.full.boxplots <- data.full %>% select(Age , Clothing.ID , Rating ,Recommended.IND , Positive.Feedback.Count) 
bp <- boxplot(data.full.boxplots, outline = FALSE)






#### Multivariate Distribution 

#Categorical Variables 


library("ggplot2")

myTable <- as.data.frame(table(data.full$Division.Name , data.full$Department.Name))
colnames(myTable) <- c("Division Name" , "Departament Name" , "Frequency")
myTable

heat.map <- ggplot(data = myTable, mapping = aes(x = `Division Name`,
                                     y = `Departament Name`,
                                     fill = Frequency )) + 
  geom_tile(aes(fill = Frequency)) + 
  theme_bw() + 
  geom_text(aes(label = Frequency), size = 3, hjust = 1, vjust = 0,colour="white")  +
  xlab(label = "Division Name") +
  ylab("Departament Name") +
  theme_economist() +
  theme(legend.position = "none", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) 
l1 <- heat.map + scale_fill_gradient(low = "#a5d2ef", high = "#ff599c")
l1

sum.all <- sum(myTable$Frequency)
per <- as.data.frame(round((myTable$Frequency/sum.all) * 100 ) )
per
myTable2 <- cbind(myTable, per )
library(plyr)
myTable3 <- rename(myTable2, c("round((myTable$Frequency/sum.all) * 100)"="Percentages"))


heat.map.percentages <- ggplot(data = myTable3, mapping = aes(x = `Division Name`,
                                                 y = `Departament Name`,
                                                 fill = Percentages )) + 
  geom_tile(aes(fill = Percentages)) + 
  theme_bw() + 
  geom_text(aes(label = Percentages), size = 3, hjust = 1, vjust = 0,colour="white")  +
  xlab(label = "Division Name") +
  ylab("Departament Name") +
  theme_economist() +
  theme(legend.position = "none", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) 
l2 <- heat.map.percentages + scale_fill_gradient(low = "#a5d2ef", high = "#ff599c")
l2

#############################
#######################DEPARTAMENT NAME + CLASS NAME 
myTable.className.departamentName <- as.data.frame(table(data.full$Class.Name , data.full$Department.Name))
colnames(myTable.className.departamentName) <- c("Class Name" , "Departament Name" , "Frequency")

heat.map.className.departamentName <- ggplot(data = myTable.className.departamentName, mapping = aes(x = `Departament Name`,
                                                 y = `Class Name`,
                                                 fill = Frequency )) + 
  geom_tile(aes(fill = Frequency)) + 
  theme_bw() + 
  geom_text(aes(label = Frequency), size = 3, hjust = 0, vjust = 0,colour="white")  +
  xlab(label = "Departament Name") +
  ylab("Class Name") +
  theme_economist() +
  theme(legend.position = "right", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) +
  scale_fill_gradient2(low = "white", mid = "#6dc3c4", high = "#f69454")
heat.map.className.departamentName


sum.all1 <- sum(myTable.className.departamentName$Frequency)
per1 <- as.data.frame(round((myTable.className.departamentName$Frequency/sum.all1) * 100 ) )
per1
myTable.className.departamentName2 <- cbind(myTable.className.departamentName, per1 )


myTable.className.departamentName3 <- rename(myTable.className.departamentName2, c("round((myTable.className.departamentName$Frequency/sum.all1) * 100)"="Percentages"))

################################

heat.map.percentages1 <- ggplot(data = myTable.className.departamentName3, mapping = aes(x = `Departament Name`,
                                                              y = `Class Name`,
                                                              fill = Percentages )) + 
  geom_tile(aes(fill = Percentages)) + 
  theme_bw() + 
  geom_text(aes(label = Percentages), size = 3, hjust = 1, vjust = 0,colour="white")  +
  xlab(label = "Departament Name") +
  ylab("Class Name") +
  theme_economist() +
  theme(legend.position = "right", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9))  +
  scale_fill_gradient2(low = "white", mid = "#6dc3c4", high = "#705174")
heat.map.percentages1

grid.arrange(heat.map.className.departamentName, heat.map.percentages1,ncol=2)

###################################################################################
###################################################################################
###################################################################################
###################################################################################

#DIVISION NAME + CLASS NAME 


myTable.className.divisionName <- as.data.frame(table(data.full$Class.Name , data.full$Division.Name))
colnames(myTable.className.divisionName) <- c("Class Name" , "Division Name" , "Frequency")

heat.map.percentages2 <- ggplot(data = myTable.className.divisionName, mapping = aes(x = `Division Name`,
                                                                                         y = `Class Name`,
                                                                                         fill = Frequency )) + 
  geom_tile(aes(fill = Frequency)) + 
  theme_bw() + 
  geom_text(aes(label = Frequency), size = 3, hjust = 1, vjust = 0,colour="white")  +
  xlab(label = "Division Name") +
  ylab("Class Name") +
  theme_economist() +
  theme(legend.position = "right", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) +
  scale_fill_gradient2(low = "#d02edd", mid = "#199790", high = "#ff7260")

heat.map.percentages2


sum.all2 <- sum(myTable.className.divisionName$Frequency)
per2 <- as.data.frame(round((myTable.className.divisionName$Frequency/sum.all2) * 100 ) )
per2
myTable.className.divisionName1 <- cbind(myTable.className.divisionName, per2 )


myTable.className.divisionName2 <- rename(myTable.className.divisionName1, c("round((myTable.className.divisionName$Frequency/sum.all2) * 100)"="Percentages"))


heat.map.percentages3 <- ggplot(data = myTable.className.divisionName2, mapping = aes(x = `Division Name`,
                                                                                     y = `Class Name`,
                                                                                     fill = Percentages )) + 
  geom_tile(aes(fill = Percentages)) + 
  theme_bw() + 
  geom_text(aes(label = Percentages), size = 3, hjust = 1, vjust = 0,colour="white")  +
  xlab(label = "Division Name") +
  ylab("Class Name") +
  theme_economist() +
  theme(legend.position = "right", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) +
  scale_fill_gradient2(low = "#d02edd", mid = "#199790", high = "#c9ff00")

heat.map.percentages3


grid.arrange(heat.map.percentages2, heat.map.percentages3,ncol=2)





###################################################################################
###################################################################################
# 
# 
# 
# #####3.2 Continuous Variable by Categorical Variable
# 
# 
# #Positive Feedback Count Distribution by Rating, Department Name, Recommended IND, and Class Name
# 
# 
# ###positive feedback of each of the groups Departament Name 
# data.positive.feedback.departament.name <- data.full %>% select(Positive.Feedback.Count , Department.Name)
# density.positive.departament.name <- aggregate(data.positive.feedback.departament.name$Positive.Feedback.Count, by=list(data.positive.feedback.departament.name$Department.Name), FUN=sum)                       
# ord <- density.positive.departament.name[order(density.positive.departament.name$x),]
# ord
# 
# ###positive feedback of each of the groups Rating
# 
# 
# data.positive.feedback.rating <- data.full %>% select(Positive.Feedback.Count , Rating)
# data.positive.feedback.rating1 <- aggregate(data.positive.feedback.rating$Positive.Feedback.Count, by=list(data.positive.feedback.rating$Rating), FUN=sum)                       
# data.positive.feedback.rating1
# ord1 <- data.positive.feedback.rating1[order(data.positive.feedback.rating1$x),]
# ord1
# 
# 
# ###########Positive feedback Recomended 
# 
# data.positive.feedback.recomended <- data.full %>% select(Positive.Feedback.Count , Recommended.IND)
# data.positive.feedback.recomended <- aggregate(data.positive.feedback.recomended$Positive.Feedback.Count, by=list(data.positive.feedback.recomended$Recommended.IND), FUN=sum)                       
# data.positive.feedback.recomended
# ord2 <- data.positive.feedback.recomended[order(data.positive.feedback.recomended$x),]
# ord2
# 
# ###########Positive feedback Class Name 
# 
# data.positive.feedback.class <- data.full %>% select(Positive.Feedback.Count , Class.Name)
# data.positive.feedback.class <- aggregate(data.positive.feedback.class$Positive.Feedback.Count, by=list(data.positive.feedback.class$Class.Name), FUN=sum)                       
# data.positive.feedback.class
# ord3 <- data.positive.feedback.class[order(data.positive.feedback.class$x),]
# ord3


######################################
###33.3 Continuous Variables on Continuous Variables


head(data.full)
data.full.age.positive.feedback <- data.full %>% select(Positive.Feedback.Count , Age)
data.full.age.positive.feedback.plot <- ggplot(data.full.age.positive.feedback, aes(x=Positive.Feedback.Count, y=Age, color=Positive.Feedback.Count, size=Positive.Feedback.Count)) +
  geom_point() +
  geom_smooth(method=lm , color="red", se=TRUE) +
  theme_economist() +
  theme(legend.position = "none", 
        legend.box = "right",
        legend.key.size = unit(1, "cm"),
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.title = element_text(size = 12),
        legend.text = element_text(size = 9),
        legend.title=element_text(face = "bold", size = 9)) +
  scale_fill_gradient2(low = "#d02edd", mid = "#199790", high = "#c9ff00")

data.full.age.positive.feedback.plot
# with marginal histogram
ggMarginal(data.full.age.positive.feedback.plot, type = "density" , color = "#199790" , xparams = list(colour = "#c9ff00")) 




#########################
###Nie jestem do tego przekonana !!!
#

####Bez outlierów 

# instances above the Q3 + 1.5IQR or below the Q1 - 1.5IQR
OutVals = boxplot(data.full.boxplots$Age, plot=FALSE)$out
sum(OutVals)
summary(OutVals)

Age <- as.data.frame(OutVals)
colnames(as)[1] <- "Age"

Clothing.ID <- as.data.frame(OutVals)
colnames(Clothing.ID)[1] <- "Clothing.ID"


Rating <- as.data.frame(OutVals)
colnames(Rating)[1] <- "Rating"


Recommended.IND <- as.data.frame(OutVals)
colnames(Recommended.IND)[1] <- "Recommended.IND"

Positive.Feedback.Count <- as.data.frame(OutVals)
colnames(Positive.Feedback.Count)[1] <- "Positive.Feedback.Count"


Positive.Feedback.Count.bp <- boxplot(Positive.Feedback.Count, outline = FALSE)

Recommended.IND.bp <- boxplot(Recommended.IND, outline = FALSE)

Rating.bp <- boxplot(Rating, outline = FALSE)


Clothing.ID.bp <- boxplot(Clothing.ID, outline = FALSE)

Age.bp <- boxplot(Age, outline = FALSE)

