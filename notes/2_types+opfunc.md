# 데이터타입 (Data Types)
## 데이터타입 확인 함수
mode(num1)
typeof(x)

## 데이터타입 종류
|데이터타입|타입명 |비고|
|---     |---    |---|
|numeric | 숫자   |R의 숫자타입은 기본 numeric (정수 + 실수) |
|logical | 논리값 |ex) logic1 <- c(TRUE, FALSE, TRUE), logic2 <- c(T, F, T)|
|vector  | 벡터형 | 동일타입 가로배열 ex) list1 <- c(1, 3, 5, 7)|
|matrix  | 행렬형 | 동일타입 가로세로배열 ex) mat3 <- matrix(1:12, nrow=2, ncol=3, byrow=T)|
|        |        | rownames(mat3) <- c("kr", "en"), colnames(mat3) <-c ("row1", "row2", "row3")|

## 행렬 Indexing
: 인덱스, 행/렬 이름 이용
```
mat3[2, 3]
mat3[, 3]     # all, col3
mat3[,-2]     # except a col
mat3["en", ]  # row by name
mat3[, 2:3]     # range
mat3[c(1,2), ]  # rows by index
```

## 데이터프레임
:동일하지 않은 타입 담는 데이터셋 객체
```
x1 <- c(100, 80, 60, 40, 30)
x2 <- c("A", "B", "C", "A", "B")
df <- data.frame(x1, x2)
```
라벨링
```
# data frame with label
df <- data.frame(score=x1, grade=x2)
df$score
df$grade     # [A B C]
```
자동 범주화 설정
```
# stringsAsFactors (no auto category)
df <- data.frame(score=x1, grade=x2, stringsAsFactors = FALSE)
df$score
df$grade    # [A", "B", "C", "A", "B"]
```

# 제어문 (Control Statements)
## 조건문 (Condition)
+ if 문
```
x <- c(1, 2, 3, 4, 5)
x    # [1] 1 2 3 4 5
y <- x + 3
y    # [1] 4 5 6 7 8

# single line result
if (sum(x) < sum(y)) print(x)

# multi-line result
if (sum(x) < sum(y)) {
  print(x)
  print(mean(x))  # 평균: 3
  print(var(x))   # 분산: 2.5
  print(mean(y))  # 평균: 6
  print(var(y))   # 분산: 2.5
}

if (mean(x) > mean(y)){
  print(paste("mean(x)가", mean(x) - mean(y), "만큼 크다"), collpase=" ")
} else{
  print(paste("mean(y)가", mean(y) - mean(x), "만큼 크다"), sep=" ")
}

# paste 함수
# : 벡터를 문자열들로 변환한 후 연결한다. [https://thebook.io/006723/ch05/08/04/01/]
x <- c(0, 100)
y <- c(1, 200)
paste(
  "This is", x, " and that is", y,           # R 객체
  sep=" ",       # 객체들을 서로 연결할 때 사용하는 구분자
  collapse=NULL  # 연결된 객체들을 하나의 문자열로 만들 때 사용하는 구분자
)
# "This is 0  and that is 100" 
# "This is 1  and that is 200" 
```

+ ifelse 문
```
x <- c(1, 2, 3, 4, 5)
y <- x + 5
ifelse(x == y, TRUE, FALSE) # compare multiple items
```
+ switch 문
```
# : x라는 값이 있으면 비교해서 해당값 리턴
switch("x", a="111", b="222", c="333", x="555")  # "555"
```
+ for 문
```
sumx <- 0
for (i in 1:10){
  sumx = sumx + i # 1, 3, 6, ...
}
sumx #55
```
+ while 문
```
sumx <- 0
i <- 1
while (i <= 10) {
  print(paste("i:",i, ", sumx:", sumx))
  sumx = sumx + i
  i = i +1
}
sumx #55
```
+ repeat 문
```
sumx <- 0
i <- 1
repeat{
  print(paste("i:",i, ", sumx:", sumx))
  sumx = sumx + i
  i = i + 1
  if(i>10){
    break
  }
}
sumx
```
