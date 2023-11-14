# 경로 설정
setwd("C:/Users/enter-your-working-directory-path/")

# 데이터 읽어오기
df <- read.csv("Telecom.csv")

# 데이터 분할
# 훈련 데이터 50%, 검증 데이터 25%, 평가 데이터 25%로 분할 

# training 50%
train.rows <- sample(rownames(df), dim(df)[1]*0.5)

# validation 25%
valid.rows <- sample(setdiff(rownames(df), train.rows), dim(df)[1]*0.25)

# test 25%
test.rows <- setdiff(rownames(df), union(train.rows, valid.rows))

# 새로운 데이터 생성
train.data <- df[train.rows,]
valid.data <- df[valid.rows,]
test.data <- df[test.rows,]

