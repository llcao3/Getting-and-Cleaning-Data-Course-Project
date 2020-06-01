library(dplyr)
setwd("/Users/lulu/R_Coursera/R_Programming/course3/course_project")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl1, destfile = "dataset.zip", method = "curl")
dateDownloaded <- date()

unzip("dataset.zip")

# Read text files with spaces as delimiter

# Read features to featurenames
path_features <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/features.txt"
features <- read.table(path_features, header=FALSE)
featurenames <- as.character(features[,2])

# Read activity labels to a data frame called activity
path_activity <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/activity_labels.txt"
activity <- read.table(path_activity, header=FALSE, col.names=c("classlabel", "activity"))
dim(activity)

# Read test data and assign featurenames to column names
path_xtest <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/test/X_test.txt"
xtest <-read.table(path_xtest, header=FALSE, col.names=featurenames)
dim(xtest)

path_ytest <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/test/y_test.txt"
ytest <-read.table(path_ytest, header=FALSE, col.names="classlabel")
dim(ytest)

path_subjecttest <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/test/subject_test.txt"
subjecttest <-read.table(path_subjecttest, header=FALSE, col.names="subject")
dim(subjecttest)

# Read train data and assign featurenames to column names
path_xtrain <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/train/X_train.txt"
xtrain <-read.table(path_xtrain, header=FALSE, col.names=featurenames)
dim(xtrain)

path_ytrain <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/train/y_train.txt"
ytrain <-read.table(path_ytrain, header=FALSE, col.names="classlabel")
dim(ytrain)

path_subjecttrain <- "/Users/lulu/R_Coursera/R_Programming/course3/course_project/UCI HAR Dataset/train/subject_train.txt"
subjecttrain <-read.table(path_subjecttrain, header=FALSE, col.names="subject")
dim(subjecttrain)

# Combine test and train datasets
DT_test <- cbind(subjecttest, ytest,xtest)

DT_train <- cbind(subjecttrain, ytrain, xtrain)

DT1 <- rbind(DT_test, DT_train)

# Extract columns containing "mean" or "std" to a new data frame DT2
DT2 <- DT1[,c(1,2,grep("mean|std", names(DT1)))]

# Merge data frames activity and DT2 to label the activities
DT3 <- full_join(DT2, activity, by="classlabel")

# Reorder DT3 to generate DT4
DT4 <- DT3[c(1,2,82,3:81)]

# Group DT4 by activity and subject and summarise all the variables by the mean. 
DT5 <- DT4%>%group_by(activity, subject)%>%summarise_all(mean)









