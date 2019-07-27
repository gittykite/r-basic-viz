# https://github.com/timelyportfolio/rCharts_d3_sankey

install.packages("Rcpp")
library(Rcpp)
install.packages("devtools")
library(devtools)
install_github("saurfang/rCharts", ref="utf-8")
library(dplyr)
library(rCharts)

DF <- read.csv("example_2015_expenditure.csv")
str(DF)
DF2 <- DF
colnames(DF2)[6] <- "value"
DF2['value'] <- round(DF2['value']/1000)
DF3 <- DF2

sum1 <- DF3 %>% group_by("소관명", "회계명") %>% summarise(sum(value))
sum2 <- DF3 %>% group_by("회계명", "분야명")%>% summarise(sum(value))
sum3 <- DF3 %>% group_by("분야명", "부문명") %>% summarise(sum(value))
sum4 <- DF3 %>% group_by("부문명", "프로그램명") %>% summarise(sum(value))
colnames(sum1) <- c("source", "target", "value")
colnames(sum2) <- c("source", "target", "value")
colnames(sum3) <- c("source", "target", "value")
colnames(sum4) <- c("source", "target", "value")

sum1 <- as.data.frame(sum1)
sum2 <- as.data.frame(sum2)
sum3 <- as.data.frame(sum3)
sum4 <- as.data.frame(sum4)
DF4 <- rbind(sum1, sum2, sum3, sum4)

sankeyPlot <- rCharts$new()
sankeyPlot$setLib('libraries/sankey')
sankeyPlot$setTemplate(script = "libraries/sankey/layouts/chart.html")
sankeyPlot$set(
  data = DF4,
  nodeWidth = 15,
  nodePadding = 13,
  layout = 300,
  width = 900,
  height = 600,
  units = "thousand won",
  title = "sankey/chart"
)
sankeyPlot


getwd()

setwd("C:/Rlab")
setwd("C:/Rlab/data-kim")

