# 빅데이터 배경지식
## 데이터 종류
* 정형데이터  
: RDB (Oracle, MySQL)
* 반정형데이터  
 : Excel, CSV(comma separated values)
* 비정형데이터  
: web site -> crawling

##  빅데이터 관련 기술
데이터 수집 단계  
ex) load 함수, web crawling
데이터 처리 단계  
ex) Hadoop (Map -> Reduce, 분산처리) 
데이터 저장 단계  
ex) Hbase, Hive, MongoDB (No SQL: key, value only)
데이터 분석 단계  
: 데이터 마이닝 (상관관계), 텍스트 마이닝, 오피니언 마이닝
데이터 시각화 단계  
ex) R, Tableau, python, D3

# dplyr func (SQL 처리 패키지)
filter()    # where
select()  # select col/variable
arrange # order by
mutate  # as


# dplyr function (SQL func)
require(dplyr)
exam <- read.csv("190713/basic/csv_exam.csv")
exam

# filter: WHERE func
exam %>% filter(class == 1) # pipe %>% (ctrl + shift + m)
exam %>% filter(class != 1)
exam %>% filter(math >= 50)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(english >= 90 | math >= 50 | class == 5)

class7 <- exam %>% filter(class %in% c(1, 3, 5)) # include %in% IN func
mean(class7$math)
mode(class7)

# select: SELECT func
# ERROR: unable to find an inherited method for function ‘select’ for signature ‘"data.frame"’
exam
exam$math
exam %>% dplyr::select(math) # explictly call library
exam %>% dplyr::select(-math)
exam %>% dplyr::select(math, class, english)
exam %>%
  filter(class == 1)
  select(english)

# arrange: ORDER BY
exam %>%  arrange(math)
exam %>%  arrange(desc(math))
exam %>%  arrange(class, math)

# mutate: make new copied dataset
exam %>%
  mutate(total = math + english + science) %>%
  head  # get heading data

# add columms
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>%
  head

exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

exam %>%
  mutate(total = math + english + science) %>%
  arrange(total) %>%
  head
