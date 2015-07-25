# 1. Merges the training and the test sets to create one data set. 
# Training and Test  set
dfXTrain <- read.table("./train/X_train.txt")
dfXTest <- read.table("./test/X_test.txt")
dfXTT <- rbind( dfXTrain, dfXTest)
head(dfXTT)


# Each row identifies the subject 
dfSTrain <- read.table("train/subject_train.txt")
dfSTest <- read.table("test/subject_test.txt")
dfSTT <- rbind(dfSTrain, dfSTest)
#head(dfSTT)

# Training and Test Labels
dfLTrain <- read.table("./train/y_train.txt")
dfLTest <- read.table("./test/y_test.txt")
dfLTT <- rbind(dfLTrain, dfLTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
dfFeatures <- read.table("./features.txt")
indicesMeansStd <- grep("-mean\\(|-std\\(", dfFeatures[, 2])
dfXTT <- dfXTT[, indicesMeansStd]
names(dfXTT) <- dfFeatures[indicesMeansStd, 2]
names(dfXTT) <- gsub("\\(|\\)", "", names(dfXTT))
names(dfXTT) <- tolower(names(dfXTT))

# 3. Uses descriptive activity names to name the activities in the data set
dfAct <- read.table("./activity_labels.txt")
dfAct[, 2] = gsub("_", "", tolower( as.character( dfAct[, 2] ) ))
dfLTT[,1] = dfAct[dfLTT[,1], 2]
names(dfLTT) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 
names(dfSTT) <- "subject"
clnDataSet <- cbind(dfSTT, dfLTT, dfXTT)
write.table(clnDataSet, "mergedCleanData.txt",row.name=FALSE)

# 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.
numCols = ncol(clnDataSet)
df <- aggregate(clnDataSet[,3:numCols], by = list(subject=clnDataSet$subject,activity=clnDataSet$activity), FUN = mean )
write.table(df, "step5DataSet.txt",row.name=FALSE)
