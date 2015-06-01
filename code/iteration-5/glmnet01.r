## R version 2.15.3 (2013-03-01) -- "Security Blanket"
## Platform: x86_64-w64-mingw32/x64 (64-bit)

## Usage:
## Type the following at the command line prompt
## R --vanilla --slave < glmnet01.r

library(glmnet)

csvTrainfile <- "train.csv"
csvTestfile <- "test.csv"
testHistoryfile <- "testHistory.csv"

testHistory <- read.csv(testHistoryfile)
numTest <- nrow(testHistory)

training <- read.csv(csvTrainfile)
target <- training$repeter
training[is.na(training)] <- 0
## colnames(xTrain)[1:3] == c("id", "repeter", "offer_quantity")
xTrain <- as.matrix(training[, -(1:3)])

test <- read.csv(csvTestfile)
test[is.na(test)] <- 0
xTest <- as.matrix(test[, -(1:3)])

model <- glmnet(xTrain, target, family = "binomial", alpha = 0, lambda = 2^17)

## The predictions for IDs not existing in test.csv are 0.
pred <- rep(0, numTest)
pred[testHistory$id %in% test$id] <- predict(model, xTest, type = "response")

## write a submission file. Leaderboard Public: 0.59565
zz <- gzfile("pred.csv.gz", "wt")
write.table(data.frame(id = testHistory$id, repeatProbability = pred), zz,
            sep=",", quote = FALSE, row.names=FALSE)
close(zz)
