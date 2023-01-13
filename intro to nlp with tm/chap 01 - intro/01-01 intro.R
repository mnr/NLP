myRandu <- randu
head(myRandu)
myRandu$rowsum <- rowSums(randu)
head(myRandu)
plot(myRandu)
