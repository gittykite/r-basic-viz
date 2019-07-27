# run simple operator (ctrl + Enter)
1+2
5 + 10 / (2 + 3)
(1/2 + 1/3)^2 / (1/3^2)

# show current working directory
getwd()
setwd("C:/Rlab/data-kim")

# set variables (alt + -)
x<-3^2
y<-(2+2)*2
z=y+2
# show variable value
x

# show all obj
ls()
# remove a obj
rm(x)
rm(y, z)
# remove all obj in list
rm(list=ls())

# show data type
# numeric type
char1 <- "blue"
char2 <- '1'
char3 <- 1
mode(char1)
mode(char2)
mode(char3)

# logical type
logic1 <- c(TRUE, FALSE, TRUE)
mode(logic1)
logic2 <- c(T, F, T)
mode(logic2)
logic3 <- c(TRUE, false)
mode(logic3)

# vector type (same type array)
# - auto conversion when types mixed
# - cannot use reserved words: if, else, for
# c(): combine func
obj <- c(3, 5, 7, 9, 11)
name_1 <- c(2, 4, "A", "B", T)
name.1 <- c("2", 4, "A", "B", T)

# logical operator
A <- T
B <- F
C <- c(T,T)
D <- c(F,T)

A & B
C | D

# matrix type
mat1 <- matrix(1:12)
mat1

mat2 <- matrix(1:12, nrow=3, ncol=4)
mat2

mat3 <- matrix(1:12, nrow=3, ncol=4, byrow=T)
mat3

mat4 <- matrix(1:12, 3, 4)
mat4

# labels
rownames(mat3) <- c("kr", "en", "math")
colnames(mat3) <-c ("row1", "row2", "row3", "row4")
mat3

# indexing
mat3[2, 3]
mat3[, 3]     # all, col3
mat3[,-2]     # except a col
mat3["en", ]  # row by name
mat3[, 2:3]     # range
mat3[c(1,2), ]  # rows by index

# show in table / excel mode (view: capital V)
View(mat3)
edit(mat3)

# use R provided data iris
data(iris)
str(iris)
View(iris)
dim(iris)
summary(iris)

# Dataframe (can contain diff data types)
x1 <- c(100, 80, 60, 40, 30)
x2 <- c("A", "B", "C", "A", "B")
df <- data.frame(x1, x2)
df

# data frame with label
df <- data.frame(score=x1, grade=x2)
df
df$score
df$grade

# stringsAsFactors (no auto category)
df <- data.frame(score=x1, grade=x2, stringsAsFactors = FALSE)
df
df$score
df$grade

# statistics func
mean(df$score)


# file IO
dir() # show files in a directory
ex1 <- read.table("C:/Rlab/data-kim/data.txt")
ex1 <- read.table("data.txt")
ex1
ex2 <- read.table("data2.txt")
ex2

# creating random data
x1 <- 1:20
x2 <- rep(c("a", "b"), 10)  # reapeat function
x3 <- sample(1:100, 20)     # random sampling in range, cnt
x1; x2; x3

# r/w files
# sametype array
data1 <- cbind(x1, x2, x3)
View(data1)
mode(data1)  # chracter
write.table(data1, file = "matrix.txt")

# diff datatype set
dataframe <- as.data.frame(data1)
dataframe
mode(dataframe) # list
write.table(data1, file = "dataframe.txt", sep="\t")
read.table("matrix.txt", sep="$") # separate by undefined char

#r/w csv files
read.csv("csv_exam.csv")
read.csv("csv_exam.csv", header = T, sep = ",") # data with header
read.csv("csv_exam.csv", stringsAsFactors = F)  # no categroy
txt <- read.table("data.txt", header = T)
write.csv(txt, file = "data.csv")

# r/w on memory
load()
save(txt, file = "data.rda")

# r/w excel files
install.packages("readxl") # aware typo: READXL
library("readxl") # can be replaced by require
require("readxl")

df_exam <- read_excel("Financial Sample.xlsx", sheet = 1)
df_exam
mean(df_exam$Sales)
