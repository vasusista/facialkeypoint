#Facial point recognition using neural networks, in R

#train.file <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/training/training.csv'

#test.file  <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/training/test.csv'

#decimated trial
traininput <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/shrunken dataset/b24train.data'
trainoutput <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/shrunken dataset/b24tar.get'
testinput <- '/home/sirius/Desktop/Sem1-Akrita/pattern recognition/project/shrunken dataset/testful.data'

#for the train file
d.train <- read.table(trainoutput,header = TRUE)
d.train <- as.matrix(d.train)
im.train <- read.table(traininput,header = FALSE)
im.train <- as.matrix(im.train)

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

