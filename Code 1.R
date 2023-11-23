library(readr)
library(dplyr)
training_data <- read_csv("D:/OneDrive - Florida State University/MyFSU_OneDrive/R-Codes/Kaggle_Competetion/training_data.csv")
dim(training_data)
y = training_data$SalePrice
p_NA = 0.1                 # allowable proportion of NA values

P1 = apply(training_data,2,function(x){mean(is.na(x))}) # Proportion of NA values
t1 = as.numeric(which(P1>p_NA));length(t1)             # variables containing more proportion of NA values than threshold
training_data <- data.frame(training_data[,-c(t1)])
y = training_data$SalePrice
# Numeric variables
numeric_data <- training_data %>%
  select_if(is.numeric)
P2 = apply(numeric_data,2,function(x){sum(x,na.rm = TRUE)})
t2 = as.numeric(which(P2>1));length(t2)  
numeric_data <- data.frame(numeric_data[,-c(t2)])
dim(numeric_data)

# Character data
char_data <- training_data %>%
  select_if(~ !is.numeric(.))
char_data = data.frame(apply(char_data,2,function(y){as.factor(y)}))
dim(char_data)


# Combining data
data = data.frame(SalePrice = y,char_data,numeric_data);dim(data)
str(data)
model = lm(SalePrice~.,data = data)
summary(model)
 y_hat =  predict(model);length(y_hat)
 length(data$SalePrice)
 sum(model$residuals**2)
mean((data$SalePrice-y_hat)**2) 
length(y_hat)
