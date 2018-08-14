DF=read.csv(("data preprossing r/Salary_Data.csv"))

# There is no missing values and no categorical data

library(caTools)
set.seed(123)
split=sample.split(DF$Salary,SplitRatio = 2/3)
training_set=subset(DF,split==TRUE)
test_set=subset(DF,split==FALSE)

# for feture scaling scale is function to be used

# Linear regression

#fitting
regressor = lm(formula=DF$Salary~DF$YearsExperience,data=training_set)
regressor
summary(regressor)

# Predictions
y_pred=predict(regressor,newdata = test_set)
y_pred

library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
             colour='blue')+
  ggtitle('Salary vs Experience')+
  xlab('Years of experience')+
  ylab('Salary')
  