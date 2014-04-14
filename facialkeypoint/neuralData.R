#Facial point recognition using neural networks, in R

#train.file <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/training/training.csv'

#test.file  <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/training/test.csv'

#decimated trial
traininput <- 'b24train.data'
trainoutput <- 'b24tar.get'
testinput <- 'testful.data'

#for the train file
d.train <- read.table(trainoutput,header = TRUE)
d.train <- as.matrix(d.train)
im.train <- read.table(traininput,header = FALSE)
im.train <- as.matrix(im.train)
d.test <- read.table(testinput, header = FALSE)
d.test = as.matrix(d.test)
#library(doMC)
#registerDoMC()
#im.train <- foreach(im = im.train, .combine=rbind) %dopar% {
#    as.integer(unlist(strsplit(im, " ")))
#}

#for the test file
im.test  <- read.table(testinput, header = TRUE)
im.test <- as.matrix(im.test)
#im.test <- foreach(im = d.test$Image, .combine=rbind) %dopar% {
#    as.integer(unlist(strsplit(im, " ")))
#}
#d.test$Image <- NULL

save(d.train, im.train, d.test, im.test, file='shrunkdata.Rd')

