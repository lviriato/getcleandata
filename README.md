# getcleandata
Repo for Coursera course "Getting and Cleaning Data"

Two R script files exist in the Repo:

1. run_script.R
2. readtidy.R

Script 1) is the script for the course project and produces 1 tidy data file (Tidy_UCI_Data.txt) as it's output.   The tidy data file contains a summary of the average values for all the features in the original UCI data set (see URL to zipped data below) that have feature names containing  either the "mean" or "std" text, representing the mean and standard deviation features.  The tidy data file shows the data by Activity (6 values) and Subjects (1-30).

Script 2) is here only for the convenience of the course markers so that they can load the resulting output file back into their R session using "source("readtidy.R")" and produce a data frame of that file called, "MyData".

For script 1) to work, the data from the following URL must be loaded into the current working directory of R.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once the files from the above zip file are in your working directory, along with the run_script.R script, excute the following command in R or Rstudio.

> source("run_script.R")

Background:
The details on the original data set can be found at the following URL and in the feature_info.txt file in the main directory (UCI HAR Dataset) acquired from the above zip file. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Basically, the data set represents 561 features and 10299 observations, collected from 30 subjects performing 6 activities. The observations are split across two sets of data, the train and test data sets. 70% of the subjects are covered by the train data set and the remaining 30% are in the test data set.  The train and test data sets are stored in two corresponding directories.   The data used in this analysis can be found in the following files and directories:

Main Directory: UCI HAR Dataset
   1. activity_labels.txt - names of the 6 activities
   2. features.txt - names of all 561 features (column names) in the train and test data sets
   3. feature_info.txt - information about how the original data set was collected and formed. (useful background information)

train subdirectory
  1. subject_train.txt - the subject data for each observation (7352 rows) in the train data set
  2. X_train.txt - train data set (7352 rows x 561 columns)
  3. y_train.txt - train activity data for each observation (7352 rows) in the train data set
  
test subdirectory
  1. subject_test.txt - the subject data for each observation (2947 rows) in the test data set
  2. X_test.txt - test data set (2947 rows x 561 columns)
  3. y_test.txt - test activity data for each observation (2947 rows) in the test data set

Script 1) performs the following operations:

1. Reads in all the data files listed above.
2. Merges the X Train and Test data sets (initially not including the subject and activity data)
3. The column names are added to the resulting data set and the names are cleaned up to be more human readable.  This was done in a different order than the original instructions since it simplified the processing with no impact to the final answer. 
4. From the overall data set with 561 columns/features, only those columns with feature names containing the words "mean" or "std" are kept (case insensitive selection).  There are 86 columns that match the above criteria.
5. The activity numbers are replaced with activity labels.
6. Finally a tidy data table is created that shows the average of each feature column in the data set defined by 5., displayed by Activity and Subject, respectively.
7. The tidy data table is saved in the output file, "Tidy_UCI_Data.txt" using the write.table function.

The Code Book has more details on the data in the tidy data file. 
