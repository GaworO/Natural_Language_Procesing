library(caret)
library(dplyr)
library(neuralnet)

#########NEURAL NETWORKS 


training_obs <- createDataPartition(data.full.final$Recommended.IND, 
                                    p = 0.7, 
                                    list = FALSE) 
data.cloths.recomended.train <- data.full.final[training_obs,]
data.cloths.recomended.test  <- data.full.final[-training_obs,]




head(data.cloths.recomended.train)
head(data.cloths.recomended.test)



NROW(data.cloths.recomended.train)
NROW(data.cloths.recomended.test)



model.formula3 <- Recommended.IND ~ Clothing.ID + Age + Positive.Feedback.Count + 
  Rating_1 + Rating_2 + Rating_3 + Rating_4 + Rating_5 + 
  Division.Name_General + Division.Name_General_Petite + 
  Division.Name_Initmates + Department.Name_Bottoms + 
  Department.Name_Dresses + Department.Name_Intimate + Department.Name_Jackets + Department.Name_Tops +
  Department.Name_Trend + Class.Name_Blouses + Class.Name_Casual_bottoms + 
  Class.Name_Chemises + Class.Name_Dresses + Class.Name_Fine_gauge + 
  Class.Name_Intimates + Class.Name_Jackets + Class.Name_Jeans + 
  Class.Name_Knits + Class.Name_Layering + Class.Name_Legwear + 
  Class.Name_Lounge + Class.Name_Outerwear + Class.Name_Pants + 
  Class.Name_Shorts + Class.Name_Skirts + Class.Name_Sleep + 
  Class.Name_Sweaters + Class.Name_Swim + Class.Name_Trend + 
  Review.length + Count.words + Title.polarity + Review.Text.polarity

data.cloths.recomended.train2 <-
  data.cloths.recomended.train[sample(1:nrow(data.cloths.recomended.train),
                                size = 10000,
                                replace = FALSE),]

data.cloths.recomended.train.mtx <- 
  model.matrix(object = model.formula3, 
               data   = data.cloths.recomended.train2)

colnames(data.cloths.recomended.train2) <- gsub(" ", "_",  colnames(data.cloths.recomended.train2))

col_list <- 
  paste(c(colnames(data.cloths.recomended.train.mtx[, -1])), collapse = "+")

col_list <- paste(c("Recommended.IND ~ ", col_list), collapse = "")
(model.formula3 <- formula(col_list))



nn <- 
  neuralnet(model.formula3,
            data = data.frame(data.cloths.recomended.train.mtx,
                              Recommended.IND = as.numeric(data.cloths.recomended.train2$Recommended.IND)) %>%
            sample_n(1000),
            hidden = c(5, 3), # number of neurons in hidden layers
            linear.output = FALSE, # T for regression, F for classification
            learningrate.limit = NULL,
            learningrate.factor = list(minus = 0.5, plus = 1.2),
            algorithm = "rprop+")


plot(nn)

#Removing the predictor variable 

data.cloths.recomended.test1 <- data.cloths.recomended.test[-9]
View(data.cloths.recomended.test)

pred_test_result <- compute(nn , data.cloths.recomended.test1[,2:42])
pred_result <- as.data.frame(pred_test_result$net.result)

head(pred_result)

pred_test_result$net.result

prestige.predict <- predict(nn, newdata = data.cloths.recomended.test$Recommended.IND)

pr.nn_ <- pred_test_result$net.result*(max(data.full.final$Recommended.IND)-min(data.full.final$Recommended.IND))+min(data.full.final$Recommended.IND)
test.r <- (data.cloths.recomended.test$Recommended.IND)*(max(data.cloths.recomended.test$Recommended.IND)-min(data.cloths.recomended.test$Recommended.IND))+min(data.cloths.recomended.test$Recommended.IND)

MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(data.cloths.recomended.test)

print(MSE.nn)



plot(data.cloths.recomended.test$Recommended.IND,pr.nn_,col='red',main='Results',pch=18,cex=0.7)




#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#########Classification TREES

install.packages(rpart)
install.packages("dummies")
library(tidyverse)
library(MASS)
library(tree)
library(caret)
library(dummies)
library(dplyr)
library(tidyverse)
library(MASS)
library(rpart)
library(rpart.plot)
library(rattle)



training_obs <- createDataPartition(data.full.final$Recommended.IND, 
                                    p = 0.7, 
                                    list = FALSE) 
data.full.final.train <- data.full.final[training_obs,]
data.full.final.test  <- data.full.final[-training_obs,]



model1.formula <- Recommended.IND ~ .

data.full.final.tree <- 
  rpart(model1.formula, # model formula
        data = data.full.final.train, # data
        method = "class")
data.full.final.tree

rpart.plot(data.full.final.tree)

fancyRpartPlot(data.full.final.tree)

summary(data.full.final.tree)


data.full.final.tree2 <- 
  rpart(model1.formula,
        data = data.full.final.train,
        method = "class",
        parms = list(split = 'information'))

data.full.final.tree2
rpart.plot(data.full.final.tree2)

fancyRpartPlot(data.full.final.tree2)

summary(data.full.final.tree2)

###################################################

data.full.final.tree3 <- rpart(model1.formula,
                                        data = data.full.final.train,
                                        method = "class",
                                        minsplit = 1000, 
                                        minbucket = 500,
                                        maxdepth = 10,
                                        # we don't impose restrictions
                                        cp = -1)

fancyRpartPlot(data.full.final.tree3)
#####################################################

data.full.final.tree4 <- rpart(model1.formula,
                                       data = data.full.final.train,
                                       method = "class",
                                       minsplit = 500, # ~ 2% of training set
                                       minbucket = 250, # ~ 1% of training set
                                       maxdepth = 30, # default
                                       cp = -1)

fancyRpartPlot(data.full.final.tree4)

data.full.final.tree4

####################################################################
# Let us use it in prediction on training set 
pred.tree1 <- predict(data.full.final.tree4,
                      data.full.final.train,
                      type = "class")

head(pred.tree4)



confusionMatrix(data = pred.tree4, # forecasts
                # actual values
                reference = as.factor(data.full.final.train$Recommended.IND),
                # we define the label of "success" (the analysed value)
                positive = "Yes")


###################################################
printcp(data.full.final.tree4)

#the lowest value ox xerror 
(opt <- which.min(data.full.final.tree4$cptable[, "xerror"]))

(cp <- data.full.final.tree4$cptable[opt, "CP"])
#########################


data.full.final.tree4.pruning <- prune(data.full.final.tree4,
                                        cp = cp)

fancyRpartPlot(data.full.final.tree4.pruning)


#########################################
source("accuracy_ROC.R")

library(ROCR)

pred.tree2 <- predict(data.full.final.tree4,
                      data.full.final.test,
                      type = "class")
pred.tree2
plot(data.full.final.tree4)
t <- table(predictions =pred.tree2 , actual =data.full.final.test$Recommended.IND)
#Right the model was 923 + 4610
t

#Accuracy 
sum(diag(t)/sum(t))


######################################ROC

library(pROC)
pred.tree4 <- predict(data.full.final.tree4,
                      data.full.final.test,
                      type = "class")

###miss classification error  0.06188538
mean(pred.tree4 != data.full.final.test$Recommended.IND)


auc <- auc(data.full.final.train$Recommended.IND , pred.tree4)
auc
plot(roc(data.full.final.test$Recommended.IND , pred.tree4))




#######################Ostateczne podsumowanie Classification Tree

pred.tree4 <- predict(data.full.final.tree4,
                      data.full.final.test,
                      type = "class")

t1 <- table(data.full.final.test$Recommended.IND,pred.tree4)
confusionMatrix(t1)



###################################################################################

