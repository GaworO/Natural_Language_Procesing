# funkcja dla modelu zapisanego jako wynik 
# funkcji train() obliczy 
# Accuracy, spec, sens i AUC

accuracy_ROC <- function(model, 
                         data, 
                         target_variable = "UCURNINS",
                         predicted_class = "Yes") {
  
  require(pROC)
  # wygeneruj prawdopodobieństwa poziomu "predicted_class"
  
  forecasts_p <- predict(model, data,
                         type = "prob")[, predicted_class]
  
  # i samą przewidywaną kategorię
  if (any(class(model) == "train")) forecasts_c <- predict(model, data) else
     forecasts_c <- predict(model, data, type = "class")
  
  # wartości rzeczywiste - pull() zamienia obiekt tibble w wector
  
  real <- (data[, target_variable]) %>% pull
  
  # pole pod wykresem ROC
  AUC <- roc(predictor = forecasts_p,
             response = real)
  
  # tabela klasyfikacji i miary na niej oparte
  
  table <- confusionMatrix(forecasts_c,
                           real,
                           predicted_class) 
  # zbieramy w ostateczny wynik
  result <- c(table$overall[1], # Accuracy
              table$byClass[1:2], # sens, spec
              ROC = AUC$auc)
  
  return(result)
  
}
