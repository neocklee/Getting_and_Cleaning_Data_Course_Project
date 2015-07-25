# Code Book
This document describes the code inside run_analysis.R.

## Raw Data
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This document describes the code for run_analysis.R.

### Merges the training and the test sets to create one data set.
Loads data, labels and subjects from UCI HAR dataset to a data.frame
* dfXTT - merged data set (X_train.txt,X_test.txt) 
* dfSTT - merged subjects (subject_train.txt,subject_test.txt)
* dfLTT - merged labels (y_train.txt, y_test.txt)

### Extracts only the measurements on the mean and standard deviation for each measurement. 
Locate the column names from features.txt and assign to data frame(dfXTT). 
* dfFeatures - Columns name of the data set (dfXTT)
* indicesMeansStd - Indices of data set with measurements on mean and standard deviation
At the end of this process, dfXTT will be filtered with measurement on the mean and standard deviation only. 
Column name will be assigned at this stage as well.

### Uses descriptive activity names to name the activities in the data set
* dfAct - Reads the activity_labels.txt and make the name descriptive as following:-
"walking" "walkingupstairs" "walkingdownstairs" "sitting" "standing" "laying"
At the end of this process, dfLTT will be assigned with column name "activities"

### Appropriately labels the data set with descriptive variable names. 
At this stage dfSTT will be assined with column name "subject" 
* clnDataSet - merged data frame of dfSTT, dfLTT, dfXTT with descriptive variable names.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Writes dfAvg data frame with average of each measurement for each activity and each subject to the ouputfile - step5DataSet.txt