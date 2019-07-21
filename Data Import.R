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


