# data preprocessing

# Importing Dataset
DF=read.csv(("data preprossing r/Data.csv"))

# Taking care of missing values
DF$Age=ifelse(is.na(DF$Age),
                    ave(DF$Age,FUN=function(x) mean(x,na.rm=TRUE)),
                    DF$Age)
DF$Salary=ifelse(is.na(DF$Salary),
              ave(DF$Salary,FUN=function(x) mean(x,na.rm=TRUE)),
              DF$Salary)

# Encoding catagorical data
DF$Country=factor(DF$Country,
                  levels=c('France','Spain','Germany'),
                  labels = c(1,2,3))
# We are encoding categorical data into numbers because we can't give characters as input to algorithms

DF$Purchased=factor(DF$Purchased,
                    levels=c('No','Yes'),
                    labels=c(0,1))

# Divide the data in training set and testing set

library(caTools)
set.seed(123)
split = sample.split(DF$Purchased,SplitRatio = 0.8)
training_set=subset(DF,split==TRUE)
testing_set=subset(DF,split==FALSE)





