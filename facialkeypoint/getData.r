library(doParallel) #Should be replaced with library(doMC) for Linux and Mac OS systems.
train.file <- 'training.csv'
test.file  <- 'test.csv'
d.train <- read.csv(train.file, stringsAsFactors=F)
im.train      <- d.train$Image
d.train$Image <- NULL
im.train <- foreach(im = im.train, .combine=rbind) %dopar% {
    as.integer(unlist(strsplit(im, " ")))
}
d.test  <- read.csv(test.file, stringsAsFactors=F)
im.test <- foreach(im = d.test$Image, .combine=rbind) %dopar% {
    as.integer(unlist(strsplit(im, " ")))
}
d.test$Image <- NULL
save(d.train, im.train, d.test, im.test, file='data.Rd')