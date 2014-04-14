library(plyr)
example.submission <- read.csv('IdLookupTable.csv')
sub.col.names <- c("RowId","Location")
cdata <- ddply(example.submission, .(ImageId), summarise, N = length(ImageId))
table(cdata$N)
fifteenpoints <- cdata[cdata$N > 8,"ImageId"]
