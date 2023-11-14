# 경로 설정
setwd("C:/Users/enter-your-working-directory-path/")

# 데이터 읽어오기
df <- read.csv("Telecom.csv")

# 가변수 생성
df$Churn.yes <- ifelse(df$Churn=="Yes",1,0)
df$Contract.one <- ifelse(df$Contract=="One year",1,0)
df$Contract.two <- ifelse(df$Contract=="Two year",1,0)

