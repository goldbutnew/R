### 2014년 보스톤 웨스트록스베리 지역의 단독주택 정보

# 필요한 패키지 설치
install.packages("gplots")
install.packages("GGally")

# 경로 설정
setwd("C:/Users/enter-your-working-directory-path/")

# 데이터 읽어오기
df <- read.csv("WestRoxbury2.csv")

# 리모델링(REMODEL) 여부에 따른 주택 가격(TOTAL.VALUE)의 평균값을 변수로 가진 데이터 프레임 df1 생성
# aggregate(data, by = '기준이 되는 컬럼', 적용할 통계)
df1 <- aggregate(df$TOTAL.VALUE, by=list(df$REMODEL), FUN=mean)

# 변수명 변경
names(df1) <- c("REMODEL", "MEAN.VALUE")

# 막대 차트 생성
barplot(df1$MEAN.VALUE, names.arg = df1$REMODEL, col=c("blue", "blueviolet", "deeppink"), xlab = "REMODEL", ylab = "MEAN.VALUE")

# 주택가격 (TOTAL.VALUE)에 영향을 미칠 수 있다고 생각하는 연속형 변수 4개를 선택하여 5개의 변수를 가진 새로운 데이터프레임 df2 생성 
df2 <- aggregate(df$TOTAL.VALUE, by=list(df$TAX, df$LOT.SQFT, df$YR.BUILT, df$GROSS.AREA), FUN=mean)

# 변수명 변경
names(df2) <-c("TAX", "LOT.SQFT", "YR.BUILT", "GROSS.AREA", "MEAN.TOTAL.VALUE")

# gplots 패키지 설치
install.packages("gplots")
install.packages("GGally")

# gplots 라이브러리 호출
library(gplots)

# heatmap 그리기
heatmap.2(cor(df2), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote = round(cor(df2), 2),
          notecol = "black", key = FALSE, trace = 'none', margins = c(9, 9))

# GGally 라이브러리 호출
library(GGally)

# df2에 포함된 변수들의 분포, 산점도 및 상관계수를 나타낸 그래프 생성
ggpairs(df2)