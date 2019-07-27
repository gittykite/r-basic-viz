# mpg: cars
mpg
data(mpg)
str(mpg)

# diamonds
str(diamonds) # show headings
head(diamonds) # print heading data
head(diamonds, 10) # print heading data
tail(diamonds) # print tailing data
tail(diamonds, 3) # print tailing data
dim(diamonds) # row, col num
summary(diamonds)


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
