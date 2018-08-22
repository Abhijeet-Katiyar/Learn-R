# Loading the data
DF = read.csv("E:/R LAB/data preprossing r/50_Startups.csv")

# Encoding categorical data
DF$State = factor(DF$State,levels=c("New York","California","Florida"),labels=c(1,2,3))

# Splitting the data
set.seed(123)
split=sample.split(DF$Profit,SplitRatio = 0.8)
training_set=subset(DF,split==TRUE)
test_set=subset(DF,split==FALSE)


# Linear Regression
regressor=lm(formula=Profit~.,data=training_set)


y_pred=predict(regressor,newdata=test_set)
y_pred




