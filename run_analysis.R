# From the current working directory, get the project data from the specified location (DataUrl)
# The per the project instructions:
#   1) Merge the training and test data sets into one.
#       Notes and Assumptions: 
#           a) The data set was created using 30 subjects or volunteers, performing 6 activities.
#           b) 561 features (column attributes) were collected for each observation (row).  
#           c) The data was split into two data sets, called the train and test data sets.
#           d) The train data set contained 70% of the subjects and the remaining 30% went into
#              test data set.
#           e) It was assumed that the data set identifying the subjects and activities are in 
#              the same order as feature data in the Train and test data sets.
#           f) It was also assumed that the 561 feature header tjtles were in the same order as
#              columns in the Train and Test data sets. 
#           g) It was assumed that part of the merging process included merging the subject, 
#              activity and feature data together for each subject based grouping, i.e. for both 
#              the Train and Test data sets. 
#           h) This script assumes the Samsung data from the location below is available from the
#              working directory using the exact names used in the zip file.
#
#           https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#  2) Extract only the measurements on the mean and standard deviation for each measurement
#       Notes and Assumptions:
#           a) all columns with column names that included the words "mean" or "std"
#              were extracted.  Limiting the extraction to just columns with names
#              that include "mean()" and "std()" seemed too restrictive since it would
#              miss columns with "meanFreq()" for example.
# 
#  3) Use descriptive activity names to name the activies in the data set.
#       Notes and Assumptions:
#           a) Here the activity labels were used to replace the activity numbers in "y_" files
#              in the test and train folders. 
#
#  4) Appropriately label the data set with descriptive variable names
#
#  5) From the Data set in step 4, create a second, independent tidy data set with the average of
#     each variable for each activity and each subject.
# 
# ---------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------
# Step 1
#  1) Merge the training and test data sets into one.
#       Also collected other data files while in each of the relevant directories
# ---------------------------------------------------------------------------------------
# Load the required libraries
library(data.table)
library(dplyr)

#go to the Samsung UCI Data Directory (default used in the zip file assumed)
setwd("./UCI HAR Dataset/")

# read the feature (column) names file
FeatureHdrs = read.table("features.txt")
ColHdrs = as.character(FeatureHdrs$V2)

# Ensure all the header names are value R names
CleanColHdrs = make.names(ColHdrs, unique = TRUE)

# Remove the "..." from the column names
CCHdrs = gsub("[.][.][.]", "_", CleanColHdrs)

# Remove the ".." from the column names
FinalColHdrs = gsub("[.][.]", "", CCHdrs)

# Read the activity label file to get all the supported activities
ActLabels = read.table("activity_labels.txt")

# go to the Train subdirectory
setwd("./train")

# Read the test feature, subject and activity data.   This data all has the same number of rows

TrainData = read.table("x_train.txt")
TrainSubject = read.table("subject_train.txt")
TrainActivity = read.table("y_train.txt")

# go to the Test subdirectory 
setwd("../test/")

# Read the test feature, subject and activity data.   This data all has the same number of rows

TestData = read.table("x_test.txt")
TestSubject = read.table("subject_test.txt")
TestActivity = read.table("y_test.txt")

# Row Merge the Train and Test Data to create one data set
AllData = rbind(TrainData, TestData)

# Return to the initial directory
setwd("../../")

# ---------------------------------------------------------------------------------------
# Step 4 of part 1 (done sooner for simplicity)
#  4) Appropriately label the data set with descriptive variable names
#
# i.e. Setup all the column headers 
# This effectively is Step 4 of the problem, but it seemed to be best to add the column names now
# and apply filtering of "mean" and "std" against those names next.
# ---------------------------------------------------------------------------------------

names(AllData) = FinalColHdrs

# ---------------------------------------------------------------------------------------
# Step 2 of part 1 of the course project
# 2) Extract only the measurements on the mean and standard deviation for each measurement
# ---------------------------------------------------------------------------------------
MeanData = select(AllData, contains("mean"))
StdData = select(AllData, contains("std"))

SubsetData = cbind(MeanData, StdData)

# ---------------------------------------------------------------------------------------
# Step 3
#  3) Use descriptive activity names to name the activies in the data set.
# ---------------------------------------------------------------------------------------
AllActivityNo = rbind(TrainActivity, TestActivity)
ActFactor = factor(AllActivityNo$V1, levels=c(1,2,3,4,5,6), labels = ActLabels$V2)
AllActivity = data.frame(ActFactor)

# ---------------------------------------------------------------------------------------
# Step 5
#  5) From the Data set in step 4, create a second, independent tidy data set with the average of
#     each variable for each activity and each subject.
# ---------------------------------------------------------------------------------------

# Prepare for step 5 by getting all the relevant data into one place. 

AllSubject = rbind(TrainSubject, TestSubject)
names(AllSubject) = "Subject"
names(AllActivity) = "Activity"

FinalData = cbind(AllSubject, AllActivity,SubsetData)
ByActivitySubject = group_by(FinalData, Activity, Subject)

TidyData = summarise_each(ByActivitySubject, funs(mean))

# Create a file of the Tidy data in the initial working directory.
write.table(TidyData, "Tidy_UCI_Data.txt", row.name = FALSE)


