library(wordcloud)
library(dplyr)
library(dummies)
library(ggplot2)


####TUTAJ SKOÑCZY£AM 

##########Frequency count of Departament and Division , Class Name

data.words.full.Division.Name <- data.full2 %>% count(Division.Name, sort=T)
data.words.full.Department.Name <- data.full2 %>% count(Department.Name, sort=T)
data.words.full.Class.Name <- data.full2 %>% count(Class.Name, sort=T)


#########Sentiment analysis Review Text 
setwd("C:\\Users\\Ola\\Desktop\\ML2_projekt")
d2 <- readr::read_csv("Womens.csv")
colnames(d2)[5] <- "review"
d2 <- d2 %>% unnest_tokens(word, review)

library(tidytext)
#fear
nrcfear <- get_sentiments("nrc") %>% filter(sentiment == "fear")
fear <- d2 %>% inner_join(nrcfear) %>% count(word, sort=T)
negative <- as.data.frame(fear)

# joy 

nrcjoy <- get_sentiments("nrc") %>% filter(sentiment == "joy")
joy <- d2 %>% inner_join(nrcjoy) %>% count(word, sort=T)
joy

# anger 

nrcanger <- get_sentiments("nrc") %>% filter(sentiment == "anger")
anger <- d2 %>% inner_join(nrcanger) %>% count(word, sort=T)


get_sentiments("bing") %>% 
  count(sentiment)

count.sentiments.positive <- get_sentiments("nrc") %>% 
  filter(sentiment %in% c("positive")) %>% 
  count(sentiment)

count.sentiments.negative <-get_sentiments("nrc") %>% 
  filter(sentiment %in% c("negative")) %>% 
  count(sentiment)





#####################################
####Positive Negative , recomended Bar Plot


d2 <- as.data.frame(d2[complete.cases(d2), ])

d4 <- d2 %>%inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, `Recommended IND`, sort = TRUE) 
as.data.frame(d4)

d5 <- d2 %>%inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, `Rating`, sort = TRUE) 
as.data.frame(d5)

d6 <- d2 %>%inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, `Department Name`, sort = TRUE) 
as.data.frame(d6)



positive.negative.recomended <- ggplot(d4, aes(`Recommended IND`, n, fill =sentiment)) + 
      geom_bar(width = 0.4, position='dodge', stat="identity") +
  xlab("Not recomended products        Recomended products") +
  ylab("Count")+
  scale_x_continuous(breaks=c(0:1)) +
  theme_economist() +
  theme(legend.position="top",
        legend.box = "horizontal",
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.ticks = element_blank(),
        axis.title = element_text(size = 12))  


p7 <- positive.negative.recomended +scale_fill_manual(values = c("#ff3232","#66b266"))
p7

###################################

positive.negative.rating<- ggplot(d5, aes(`Rating`, n, fill =sentiment)) + 
  geom_bar(width = 0.4, position='dodge', stat="identity") +
  xlab("Rating") +
  ylab("Count")+
  scale_x_continuous(breaks=c(1:5)) +
  theme_economist() +
  theme(legend.position="top",
        legend.box = "horizontal",
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.ticks = element_blank(),
        axis.title = element_text(size = 12))  


p8 <- positive.negative.rating + scale_fill_manual(values = c("#a6003a","#59c3b1"))
p8


#data.full.age.positive.feedback <- data.full %>% select(data.full$Positive.Feedback.Count, data.full$Age)
######################################################

positive.negative.departament<- ggplot(d6, aes(`Department Name`, n, fill =sentiment)) + 
  geom_bar(width = 0.4, position='dodge', stat="identity") +
  xlab("Department Name") +
  ylab("Count")+
  theme_economist() +
  theme(legend.position="top",
        legend.box = "horizontal",
        axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.ticks = element_blank(),
        axis.title = element_text(size = 12))  


p9 <- positive.negative.departament + scale_fill_manual(values = c("#f96161","#ffc100"))
p9








#########################################

d2 %>% inner_join(get_sentiments("bing")) %>% count(word, sentiment, sort=T) %>% ungroup()
data.full.positive.negative <- d2 %>% inner_join(get_sentiments("bing")) %>% count(word, sentiment, sort=T) %>% ungroup()
data.full.positive.negative



data.full.positive.negative %>% group_by(sentiment) %>% 
  top_n(15) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) + 
  geom_col(show.legend = F) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment",x=NULL) + 
  coord_flip() +
  theme_economist() +
  geom_text(position = "dodge" , aes(label=n),family = "Tahoma" , size = 4) +
  theme(axis.title.x = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        axis.title.y = element_text(family = "Tahoma" , face = "bold", size = 12) ,
        plot.title = element_text(family="Tahoma"),
        text = element_text(family = "Tahoma"),
        axis.ticks = element_blank(),
        axis.title = element_text(size = 12))  




d2 %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort=TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("red", "green"),
                   max.words=150)



### word cout columns 
list.words = as.data.frame(data.full[c("Review.Text" ,"Department.Name" , "Title" , 
                                       "Class.Name" , "Division.Name")])

### Text mining analysis 

#analiza dla titel 

data.review.corpus <- Corpus(VectorSource(data.full$Title))

inspect(data.review.corpus)


data.corpus.removeNumber <- tm_map(data.review.corpus, removeNumbers)
data.corpus.tolower <- tm_map(data.corpus.removeNumber, content_transformer(tolower))
data.corpus.removewords <- tm_map(data.corpus.tolower, removeWords, stopwords("english"))

dtm <- as.matrix(TermDocumentMatrix(data.corpus.removewords))
gc()
m <- as.matrix(dtm)
v <- sort(rowSums(dtm),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)


wordcloud2(d , size = 2,
           color = "random-light", backgroundColor = "grey")



barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words in Title",
        ylab = "Word frequencies")


###########Sentiment analysis sencnces 


#############Polarity values 

####Review Text 


as.character(data.full2$Review.Text) %>% sentiment_by(by = NULL) %>% highlight()

Review.Text.polarity.vector <- as.character(data.full2$Review.Text)


Review.Text.polarity <- as.data.frame(sentiment(Review.Text.polarity.vector))


Review.Text.polarity1 <- as.data.frame(aggregate( Review.Text.polarity$sentimen ~ Review.Text.polarity$element_id, Review.Text.polarity, mean ))

data.full4 <- as.data.frame(cbind(data.full3, Review.Text.polarity1$`Review.Text.polarity$sentimen`))



colnames(data.full4)[13] <- "Review.Text.polarity"



#####Title 

#look at highlights of all of the sentences

as.character(data.full2$Title) %>% sentiment_by(by = NULL) %>% highlight()


###Find duplicate values 


n_occur <- data.frame(table(Title.polarity$element_id))


#Elements that had more than one sentence in a column 

Title.polarity[Title.polarity$element_id %in% n_occur$Var1[n_occur$Freq > 1],]

#make a mean by the group find values that are the same and make an average sentiment of them

Title.polarity1 <- as.data.frame(aggregate( Title.polarity$sentimen ~ Title.polarity$element_id, Title.polarity, mean ))




#add values to the data frame 


data.full3 <- as.data.frame(cbind(data.full2, Title.polarity1$`Title.polarity$sentimen`))
View(data.full3)

colnames(data.full3)[13] <- "Title.polarity"

#maybe add plot of polarity ?




######################Change categorical values to 0 , 1 

#data.full.4 <- NIE RUSZAÆ DOBREA BAZAD O ZMIAN
View(dat3)
colnames(data.full4)
dat4 <- data.full4 %>% select(Age , Rating , Clothing.ID , Review.length , Positive.Feedback.Count , Count.words , Recommended.IND , Review.Text.polarity , Title.polarity )
View(data.full5)

data.full5 <- data.full4 %>%
  dummy.data.frame(names="Division.Name", sep="_")

data.full6 <- data.full5 %>%
  dummy.data.frame(names="Department.Name", sep="_")

data.full7 <- data.full6 %>%
  dummy.data.frame(names="Class.Name", sep="_")
data.full.final <- data.full7 %>%
  dummy.data.frame(names="Rating", sep="_")


View(data.full.final)
