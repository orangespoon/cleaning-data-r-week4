install.packages("dplyr")
library(dplyr)
setwd("./projects/cleaning-data-r-week4")

## read data into memory...
test_subjects <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = " ")
test_activities <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = " ")
test_data <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

train_subjects <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = " ")
train_activities <- read.csv("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = " ")
train_data <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

labels <- read.csv("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ")
features <- read.csv("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = " ")

## 3 and 4 set column names for use as descriptive activity and variable names...
names(labels) <- c('ActivityID','ActivityName')
names(test_subjects) <- 'SubjectID'
names(train_subjects) <- 'SubjectID'
names(test_activities) <- 'ActivityID'
names(train_activities) <- 'ActivityID'
names(test_data) <- features[,2]
names(train_data) <- features[,2]

## 1 Merge data sets (incl. col binding their descriptive names first)...
mergedRs <- rbind(cbind(train_activities, train_subjects, train_data), 
                 cbind(test_activities, test_subjects, test_data))

## last bit of 3: merge the descriptive names for activities
mergedRs <- merge(mergedRs, labels, by="ActivityID", all.x=TRUE)

# 2 grep on the col names to select out mean and std dev and group IDs...
mergedRs <- mergedRs[ , (  grepl("ActivityID", names(mergedRs), ignore.case=TRUE) | 
                           grepl("ActivityName", names(mergedRs), ignore.case=TRUE) | 
                           grepl("SubjectID", names(mergedRs), ignore.case=TRUE) |
                           grepl("mean", names(mergedRs), ignore.case=TRUE) | 
                           grepl("std", names(mergedRs), ignore.case=TRUE) 
                        )]

## 5 average of each variable by  activity + subject, be tidy
finalRs <- aggregate(. ~SubjectID + ActivityID + ActivityName, mergedRs, mean)
write.table(finalRs, "tidy_data_final.txt", row.names=FALSE)

