# getcleandata
Repo for Coursera course "Getting and Cleaning Data"

Two R script files exist in the Repo:
1) run_script.R
2) readtidy.R

Script 1) is the script for the course project and produces 1 tidy data file (Tidy_UCI_Data.txt) as it's output.
Script 2) is here only for the convenience of the course markers so that they can load the resulting output file back into their R session using "source("readtidy.R")" and produce a data frame of that file called, "MyData".

For script 1) to work, the data from the following URL must be loaded into the current working directory of R.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Background:
The details on this data set can be found at the following URL and in the feature_info.txt file in the main directory (UCI HAR Dataset) acquired from the above zip file. 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Basically, the data set represents 561 features and 10299 observations, collected from 30 subjects performing 6 activities. The observations are split across two sets of data, the train and test data sets. 70% of the subjects are covered by the train data set and the remaining 30% are in the test data set.  The train and test data sets are stored in two corresponding directories.   The data used in this analysis are found in the following files and directories:

Main Directory: UCI HAR Dataset
   1) activity_labels.txt - names of the 6 activities
   2) features.txt - names of all 561 features (column names) in the train and test data sets
train subdirectory
  1) subject_train.txt - the subject data for each observation (7352 rows) in the train data set
  2) X_train.txt - train data set (7352 rows x 561 columns)
  3) y_train.txt - train activity data for each observation (7352 rows) in the train data set
test subdirectory
  1) subject_test.txt - the subject data for each observation (2947 rows) in the test data set
  2) X_test.txt - test data set (2947 rows x 561 columns)
  3) y_test.txt - test activity data for each observation (2947 rows) in the test data set

Script 1) performs the following operations:

a) Reads in all the data files listed above.
b) Merges the X Train and Test data sets (initially not including the subject and activity data)
c) From the overall data set with 561 columns/features, only those with the words "mean" or "std" are kept.
d) In the resulting combined data set there are 86 columns that match the above (c) criteria. 
e) The activity numbers are replaced with activity labels/names and each column has an appropriate name.
f) Finally a tidy data table is created that shows the average of each feature column in the data set defined by set (e), shown by Activity and Subject.
g) The tidy data table is saved in the output file, "Tidy_UCI_Data.txt" 

The Code Book has more details on the data in the tidy data file. 
