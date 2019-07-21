#creat a project template
library('ProjectTemplate')

#create a project
create.project('EDA',minimal = TRUE,merge.strategy = 'allow.non.conflict')

#install packages for future use
install.packages('ggplot2')

install.packages('tidyverse')

install.packages('rmarkdown')
getwd()
# my current working directory is "/Users/tsing/Desktop/RWorkflow/Workshop-R-Workflow"

setwd(dir = "/Users/tsing/Desktop/RWorkflow/Code-Portfolio")
# I changed my working directory to "/Users/tsing/Desktop/RWorkflow/Code-Portfolio"

ls()
# I have 0 character in my workplace

study.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study.df)

study.htest <- t.test(score ~ sex, 
                       data = study.df)
# I created some objects to save

save(study1.df, score.by.sex, study1.htest,
     file = "week2/data/study.RData")

setwd(dir = "/Users/tsing/Desktop/RWorkflow/Code-Portfolio/week2")
# I changed my working directory to "/Users/tsing/Desktop/RWorkflow/Code-Portfolio/week2"

save(study.df, score.by.sex, study.htest,
     file = "data/study.RData")
# I saved the study.RData in "/Users/tsing/Desktop/RWorkflow/Code-Portfolio/week2/data"

save.image(file = "data/projectimage.RData")
# projectimage.RData contains all objects in my currect workspace

load(file = "data/study.RData")
# I loaded all objects in study.RData

load(file = "data/projectimage.RData")
# I loaded all objects in my workspace

save.image(file = "data/projectimage2.RData")

rm(projectimage2.RData)

install.packages('pirates')

write.table(x = study.df,
            file = "study.txt",sep = "\t")
#  I saved a text file called study.txt in my working directory

mydata <- read.table(file = 'study.txt',
                     sep = '\t',
                     header = TRUE,
                     stringsAsFactors = FALSE)
# I read a text file called study.txt in my working directory

fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)
# I read a text file from the web

setwd(dir = "/Users/tsing/Desktop/RWorkflow/Code-Portfolio/week3")
# I changed my working directory to "/Users/tsing/Desktop/RWorkflow/Code-Portfolio/week3"

library(readr)
ozone <- read_csv("data/US EPA data 2017.csv")
# I loaded the .csv file

names(ozone) <- make.names(names(ozone))
# I rewrote the name of the columns to remove any spaces.

nrow(ozone)
# the number of rows is 66869

ncol(ozone)
# the number of rows is 55

str(ozone)
# the classes of each of the columns are correctly specified

head(ozone[, c(6:7, 10)])
tail(ozone[,c(6:7, 10)])
# I peek at the top and bottom of the data

table(ozone$Sample.Duration)
# I looked at the Sample Duration variable to see what durations are recorded as being taken.

library(dplyr)
filter(ozone, Sample.Duration == "15 MINUTE") %>% 
select(State.Name, County.Name, 
       Sample.Duration, Arithmetic.Mean)
# I took a look at which observations were measured at 15-minute duration

filter(ozone, State.Code == "11"
       County.Code == "954"
       Sample.Duration == "15 MINUTE") %>%
  select(Arithmetic.Mean)%>%
  as.data.frame

x <- 1:5
y <- 6:10
z <- 11:15
# I created 3 vectors of length 5

cbind(x, y, z)
# I created a matrix where x, y and z are columns

rbind(x, y, z)
# I created a matrix where x, y and z are rows

cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e"))
# I created a matrix with numeric and character columns

matrix(data = 1:20,
       nrow = 5,
       ncol = 4)
# I created a matrix containing the values from 1 to 20 with 5 rows and 4 columns

matrix(data = 1:20,
       nrow = 4,
       ncol = 5)
# I created a matrix containing the values from 1 to 20 with 4 rows and 5 columns

matrix(data = 1:20,
       nrow = 4,
       ncol = 5,
       byrow = TRUE)
# now with 4 rows and 5 columns, but fill by row instead of columns

survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "f", "f", "f"),
                     "age" = c(34, 89, 26, 53, 33))
str(survey)
# I showed the structure of the survey
## 'data.frame':	5 obs. of  3 variables:
### $ index: num  1 2 3 4 5
#### $ sex  : Factor w/ 2 levels "f","m": 2 2 1 1 1
##### $ age  : num  34 89 26 53 33

survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23),
                     stringsAsFactors = FALSE)
str(survey)
# no more factors
## 'data.frame':	5 obs. of  3 variables:
### $ index: num  1 2 3 4 5
#### $ sex  : chr  "m" "m" "m" "f" ...
##### $ age  : num  99 46 23 54 23


pirates <- data.frame("name" = c("Astrid", "Lea", "Sarina", "Remon", "Letizia", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
                     "sex" = c("f", "f", "f", "m", "f", "f", "m", "f", "f", "f"),
                     "age" = c(30, 25, 25, 29, 22, 22, 35, 19, 32, 21),
                     "Superhero" = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott", "Superman"),
                     "Tattoos" = c(11, 15, 12, 5, 65, 3, 9, 13, 900, 0),
                     stringsAsFactors = FALSE)
str(pirates)
# typed in objects for pirates

median(pirates$age)
# the median age of 10 pirates is 25

aggregate(formula = age ~ sex,
          data = pirates,
          FUN = mean)
# female mean age: 24.5; male mean age: 32

with(pirates, 
     max(Tattoos[sex == "m"]))
# 9 was the most number of tattoos owned by a male pirate

with(pirates, 
     mean(sex[age < 32] == "f"))
# 87.5% of pirates under the age of 32 were female

with(pirates, 
     mean(age[sex == "f"] < 32))
# 87.5% of female pirates were under the age of 32

pirates$tattoos.per.year <- with(pirates, Tattoos / age)

pirates$name[pirates$tattoos.per.year == max(pirates$tattoos.per.year)]
# Niveditha had the most number of tattoos per year

pirates$name[with(pirates, sex == "f" & Superhero == "Superman")]
# Lea, Wendy, and Gioia are the female pirates whose favorite piratesurvey is Superman

with(pirates, (Tattoos[age > 20 & Superhero == "Spiderman"]))
# 5 is the median number of tattoos of pirates over the age of 20 whose favorite superhero is Spiderman



