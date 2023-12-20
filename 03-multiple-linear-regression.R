setwd("C:/Users/enter-your-working-directory-path/")
df <- read.csv("BostonHousing.csv")

# 다중공선성 문제를 발생시킬 수 있는 변수들 모형에서 제외
selected.var <- c(1,2,4,5,6,7,8,9,11,12,13)

# partition data
set.seed(1)
train.index <- sample(c(1:1000), 600)
train.df <- df[train.index, selected.var]
valid.df <- df[-train.index, selected.var]

lm <- lm(MEDV ~ ., data = train.df)

# use options() to ensure numbers are not displayed in scientific notation
options(scipen = 999)

# checking preprocessing data
summary(lm)

# install.packages("leaps")
library(leaps)

# exhaustive search
search <- regsubsets(MEDV ~ ., data = train.df, nbest = 1, nvmax = dim(train.df)[2],
                     method = "exhaustive")
sum <- summary(search)
sum$which
sum$rsq
sum$adjr2

# foward selection 
lm.null <- lm(MEDV~1, data = train.df)
lm.step <- step(lm.null,   
                scope=list(lower=lm.null, upper=lm), direction =  
                  "forward")
summary(lm.step) 

# backward elimination
lm.step <- step(lm, direction = "backward")
summary(lm.step) 

# stepwide selection
lm.step <- step(lm, direction = "both")
summary(lm.step)
