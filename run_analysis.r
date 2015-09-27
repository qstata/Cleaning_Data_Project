## Getting and Cleaning Data Course Project
## 9/27/2015

## Download data for the project:
## The datafiles are all in a folder named "UCI HAR Dataset".
dataFolder <- "UCI HAR Dataset"
if (!file.exists("UCI HAR Dataset")) {
    sourceURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    sourceData <- "getdata_projectfiles_UCI HAR Dataset.zip"
    if (!file.exists(sourceData)) {
        download.file(sourceURL, sourceData, method="curl")
    }
    unzip(sourceData)
}

## Load required packages.
library(data.table)
library(reshape)


## Read the data files
## (1) Read the subject files.
Train.Subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
colnames(Train.Subject) <- "subject"
Test.Subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
colnames(Test.Subject) <- "subject"
## Combined the Trian and Test subject data
Subject <- rbind(Train.Subject, Test.Subject)
Subject$subject <- factor(Subject$subject)

## (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## Read the features data
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
colnames(features) <- c("feature", "feature.code")
features.sub <- subset(features, grepl("mean\\(\\)|std\\(\\)",features[,2])) 
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
X_test  <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
X <- rbind(X_train, X_test)[,features.sub[,1]]

## (3) Uses descriptive activity names to name the activities in the data set.
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
colnames(y_train) <- "activity"
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
colnames(y_test) <- "activity"
## Read the activity_labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
## Combined the Trian and Test activity data
Activity <- rbind(y_train, y_test)
Activity[,1] <- factor(Activity[,1], levels=activity_labels[,1], labels=activity_labels[,2])

## (4) Appropriately labels the data set with descriptive variable names.
d1 <- cbind(Subject, Activity, X)
d2 <- melt(d1, id=c("subject", "activity"))
d3 <- aggregate(d2$value, list(d2[,1], d2[,2], d2[,3]), mean)
colnames(d3) <- c("subject", "activity", "feature", "value")
d3$feature <- as.numeric(gsub("V", "", d3$feature))
d4 <-  merge(d3, features.sub, by="feature")
dt <- d4[,-5]
dt$feature <- d4$feature.code

my.grep <- function(x) grepl(x, dt$feature)
## Features with two categories
n <- 2; y <- matrix(seq(1, n), nrow = n)
x <- matrix(c(my.grep("^t"), my.grep("^f")), ncol = nrow(y))
dt$featDomain <- factor(x %*% y, labels = c("Time", "Freq"))
x <- matrix(c(my.grep("Acc"), my.grep("Gyro")), ncol = nrow(y))
dt$featInstrument <- factor(x %*% y, labels = c("Accelerometer", "Gyroscope"))
x <- matrix(c(my.grep("BodyAcc"), my.grep("GravityAcc")), ncol = nrow(y))
dt$featAcceleration <- factor(x %*% y, labels = c(NA, "Body", "Gravity"))
x <- matrix(c(my.grep("mean()"), my.grep("std()")), ncol = nrow(y))
dt$featVariable <- factor(x %*% y, labels = c("Mean", "SD"))
## Features with 1 category
dt$featJerk <- factor(my.grep("Jerk"), labels = c(NA, "Jerk"))
dt$featMagnitude <- factor(my.grep("Mag"), labels = c(NA, "Magnitude"))
## Features with three categories
n <- 3; y <- matrix(seq(1, n), nrow = n)
x <- matrix(c(my.grep("-X"), my.grep("-Y"), my.grep("-Z")), ncol = nrow(y))
dt$featAxis <- factor(x %*% y, labels = c(NA, "X", "Y", "Z"))


## (5) From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
tidy <- dt[,c(2,3,1,5:11,4)]

# Show the data sturcture of tidy data
str(tidy)

# show the first 5 rows of tidy data
head(tidy, 5)

# Write the tidy data into text file.
write.table(tidy, file="UCI_HAR_Dataset(tidy).txt", row.names=FALSE)

## END

