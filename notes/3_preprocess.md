# File IO
- working directory에 넣어놓고 경로/파일명으로 로드
- readTableHeader 오류 시 txt 파일 마지막줄에 carrier return 추가

## Read txt File
```
dir() # show files in a directory
ex1 <- read.table("C:/Rlab/data-kim/data.txt")
ex1 <- read.table("data.txt")
ex1
```

## Write txt file
```
# creating random data
x1 <- 1:20
x2 <- rep(c("a", "b"), 10)  # repeat function
x3 <- sample(1:100, 20)     # random sampling in range, cnt
x1; x2; x3

data1 <- cbind(x1, x2, x3)
View(data1)
mode(data1)  # chracter
write.table(data1, file = "matrix.txt")
```

# r/w mutliple datatype set
```
dataframe <- as.data.frame(data1)
dataframe
mode(dataframe) # list
write.table(data1, file = "dataframe.txt", sep="\t")
read.table("matrix.txt", sep="$") # separate by undefined char
```

#r/w csv files
```
read.csv("csv_exam.csv")
read.csv("csv_exam.csv", header = T, sep = ",") # data with header
txt <- read.table("data.txt", header = T)
write.csv(txt, file = "data.csv")
```

# r/w on memory
```
load()
save(txt, file = "data.rda")
```

# r/w excel files
```
install.packages("readxl") # aware typo: READXL
library("readxl") # can be replaced by require
require("readxl")

df_exam <- read_excel("Financial Sample.xlsx", sheet = 1)
df_exam
mean(df_exam$Sales)
```
