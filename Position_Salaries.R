DF=read.csv("E:/R LAB/data preprossing r/Position_Salaries.csv")

DF=DF[2:3]

library(caTools)
set.seed(123)
split=sample.split(DF$Salary,SplitRatio = 0.6)
training_set=subset(DF,split==TRUE)
test_set=subset(DF,split==FALSE)

#Linear Regression
regressor = lm(formula=Salary~.,data=training_set)
y_pred=predict(regressor,newdata = test_set)

y_pred


# Ploynomial Regression
DF$Level2=DF$Level^2
DF$Level3=DF$Level^3
DF$Level4=DF$Level^4
DF$Level5=DF$Level^5
poly_reg=lm(formula= Salary~.,data=DF)

# plotting

library(ggplot2)
ggplot()+
  geom_point(aes(x=DF$Level,y=DF$Salary),
             colour='red')+
  geom_line(aes(x=DF$Level,y=predict(poly_reg,newdata=DF)),
            colour='blue')+
  ggtitle('Polynomial regression')
  