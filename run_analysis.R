#Downloading data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# Getting Features
# Appropriately label the data set with descriptive variable names
Features <- data.table(raed.table("./data/UCI HAR Dataset/features.txt"))
Features <- transpose(Features[,c(2),with = FALSE])
colnames(trainData) <- Features

# Getting Training Data
trainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
trainData <- cbind(trainSubject,trainLabel,trainData)

# Getting Test Data
setwd("test")
testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
testData <- cbind(testSubject,testLabel,testData)

#Getting Activity Data
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("activityId","activityType")

# Merge the training and the test sets to create one data set.
Data <- rbind(trainData,testData)
colnames(Data) = c("subject","activityId",Features)

##Extract only the measurements on the mean and standard deviation for each measurement.
ind <- grep(".*mean.*|.*std.*",tolower(names(Data)))
ind <- data.table(ind)
wantedMeaurment <- Data[,ind]
wantedMeaurment <- cbind(Data$subject,Data$activityId,wantedMeaurment)
colnames(wantedMeaurment)[c(1,2)] <- c("subject","activityId")


# Use descriptive activity names to name the activities in the data set
wantedMeaurment$activityId <- factor(wantedMeaurment$activityId, levels=activityLabels$activityId, labels=activityLabels$activityType)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- aggregate(. ~ subject + activityId, data = wantedMeaurment, mean)
write.table(tidy, "tidy.txt", sep="\t")
