library("gridExtra")
#Divison Name 

 division.name <-  ggplot(data.full, aes(x= Division.Name)) + 
   geom_bar(aes(y = ..count.., fill = factor(..x..)), stat="count") +
   geom_text(stat='count', aes(label=..count..), vjust=-0.5 ,family = "Tahoma" ,  size = 4) +
   guides(fill=FALSE) +
   xlab("Division Name") +
   ylab(" ") + 
   ggtitle("Count of products in each division") +
   theme_economist() +
   theme(axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         plot.title = element_text(family="Tahoma"),
         text = element_text(family = "Tahoma"),
         axis.text.y=element_blank(),
         axis.ticks = element_blank(),
         axis.title = element_text(size = 12)) 
 
p1 <- division.name +scale_fill_brewer(palette="Dark2")
p1
 #Departament Name 
 
 library("RColorBrewer")
 
 departament.name <-  ggplot(data.full, aes(x= Department.Name)) + 
   geom_bar(aes(y = ..count.., fill = factor(..x..)), stat="count") +
   geom_text(stat='count', aes(label=..count..), vjust=-1 ,family = "Tahoma" , size = 4) +
   guides(fill=FALSE) +
   xlab("Products") +
   ylab(" ") + 
   ggtitle("Count of products in departaments") +
   theme_economist() +
   theme(axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         plot.title = element_text(family="Tahoma"),
         text = element_text(family = "Tahoma"),
         axis.ticks = element_blank(),
         axis.text.y=element_blank(),
         axis.title = element_text(size = 12))  
   
p2 <- departament.name +  scale_fill_brewer(palette="Spectral")
 p2
 #Class Name 
 
 
 
 class.name <-  ggplot(data.full, aes(x= Class.Name)) + 
   geom_bar(aes(y = ..count.., fill = factor(..x..)), stat="count") +
   geom_text(stat='count', aes(label=..count..), vjust=-1 ,family = "Tahoma" , size = 4) +
   guides(fill=FALSE) +
   xlab("All products") +
   ylab(" ") + 
   ggtitle("Count of each product") +
   theme_economist() +
   theme(axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
         plot.title = element_text(family="Tahoma"),
         text = element_text(family = "Tahoma"),
         axis.text.y=element_blank(),
         axis.ticks = element_blank(),
         axis.text.x = element_text(size=7),
         axis.title = element_text(size = 12)) 
 
p3 <- class.name +  scale_fill_manual(values = c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080', '#ffffff', '#000000'))
 
all <- grid.arrange(p1,p2,p3)
p1 


####Product popularity 


install.packages("kableExtra")

# For dev version
# install.packages("devtools")

devtools::install_github("haozhu233/kableExtra")
library(knitr)
library(kableExtra)

c <- as.data.frame(sort(table(data.full$Clothing.ID),decreasing=TRUE)[1:10])
colnames(c) <- c("Number of an item", "Occuances of an item")

# kable(c) %>%
#   kable_styling("striped", full_width = F) %>%
#   column_spec(5:7, bold = T) %>%
#   row_spec(3:5, bold = T, color = "white", background = "#D7261E")

kable(c) %>%
  kable_styling(bootstrap_options = "striped", full_width = F) %>%
  column_spec(1:2, bold = T) %>%
  row_spec(0, color = "black") %>%
  row_spec(1:3, bold = T, color = "white", background = "#D7261E")

