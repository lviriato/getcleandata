# Tidy_UCI_Data.txt Code Book

## Description:
This code book outlines all the variables used in the Tidy_UCI_Data.txt file output from the run_analysis.R script.

The Tidy UCI data file contains 180 rows and 88 columns.   The original data is from the following zip file and was processed by the run_analysis.R script to produce the Tidy_UCI_Data.txt file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The Tidy UCI data file contains the average value for each feature data column in the original data set where the feature name contained either the word "mean" or "std" (representing Mean and Standard Deviation calculations).   There were 86 feature columns that matched this criteria.  The calculated average value for each of these feature columns is shown in the tidy data set by Activity and Subject, respectively.

## Column Summary:
The columns in the tidy data set can be summarized as follows:

- **Activity**: This column has 6 values, representing each of the 6 activities performed by the 30 subjects that participated in the original UCI experiment.
	Values:
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING

- **Subject**: This column has values of 1-30 to represent each of the 30 subjects that participated in the original UCI experiment.

- **Feature Columns**: The remaining 86 columns in the tidy data file represent the feature data for 53 features calculating the mean of a variable and 33 features calculating the standard deviation of a variable.  These variables are explained in more detail below. 

## Feature Info:
*This section is a subset of the content from feature_info.txt file in the original data file content; from the url above*

*The following description is for the original data set.  The tidy data set contains ONLY the average of the feature values in each of the selected feature columns.*

**-----------------------------------------------------------------------------------------------------------------------**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*The variable names in this section are the ones used in the original data set.  The variable names in the Tidy data set are described later in the Code Book.*

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Note on Feature Units
The original data set represented variables that were normalized to *[-1,1]* (per the README file in the original zip data) and were therefore unitless. 

## Complete Mean Feature Name List (53):
The Tidy variable names are self explanitory and correspond to the explanation provided in the feature_info.txt file referenced above.  The Tidy variable names contain a few abbreviations since they were not ambiguous and helped keep the names as concise as possible but still intuitive to read and understand. 

The few abbreviations that remain are:
- Freq - Frequency
- Std - Standard Deviation
- Gyro - Gyroscope

*Note that all the original variables were normalized between [-1, 1] and are therefore unitless.*

1.	Time.Body.Accelerometer.Mean_X
2.	Time.Body.Accelerometer.Mean_Y
3.	Time.Body.Accelerometer.Mean_Z
4.	Time.Gravity.Accelerometer.Mean_X
5.	Time.Gravity.Accelerometer.Mean_Y
6.	Time.Gravity.Accelerometer.Mean_Z
7.	Time.Body.Accelerometer.Jerk.Mean_X
8.	Time.Body.Accelerometer.Jerk.Mean_Y
9.	Time.Body.Accelerometer.Jerk.Mean_Z
10.	Time.Body.Gyro.Mean_X
11.	Time.Body.Gyro.Mean_Y
12.	Time.Body.Gyro.Mean_Z
13.	Time.Body.Gyro.Jerk.Mean_X
14.	Time.Body.Gyro.Jerk.Mean_Y
15.	Time.Body.Gyro.Jerk.Mean_Z
16.	Time.Body.Accelerometer.Magnitude.Mean
17.	Time.Gravity.Accelerometer.Magnitude.Mean
18.	Time.Body.Accelerometer.Jerk.Magnitude.Mean
19.	Time.Body.Gyro.Magnitude.Mean
20.	Time.Body.Gyro.Jerk.Magnitude.Mean
21.	Freq.Body.Accelerometer.Mean_X
22.	Freq.Body.Accelerometer.Mean_Y
23.	Freq.Body.Accelerometer.Mean_Z
24.	Freq.Body.Accelerometer.Mean.Freq_X
25.	Freq.Body.Accelerometer.Mean.Freq_Y
26.	Freq.Body.Accelerometer.Mean.Freq_Z
27.	Freq.Body.Accelerometer.Jerk.Mean_X
28.	Freq.Body.Accelerometer.Jerk.Mean_Y
29.	Freq.Body.Accelerometer.Jerk.Mean_Z
30.	Freq.Body.Accelerometer.Jerk.Mean.Freq_X
31.	Freq.Body.Accelerometer.Jerk.Mean.Freq_Y
32.	Freq.Body.Accelerometer.Jerk.Mean.Freq_Z
33.	Freq.Body.Gyro.Mean_X
34.	Freq.Body.Gyro.Mean_Y
35.	Freq.Body.Gyro.Mean_Z
36.	Freq.Body.Gyro.Mean.Freq_X
37.	Freq.Body.Gyro.Mean.Freq_Y
38.	Freq.Body.Gyro.Mean.Freq_Z
39.	Freq.Body.Accelerometer.Magnitude.Mean
40.	Freq.Body.Accelerometer.Magnitude.Mean.Freq
41.	Freq.Body.Accelerometer.Jerk.Magnitude.Mean
42.	Freq.Body.Accelerometer.Jerk.Magnitude.Mean.Freq
43.	Freq.Body.Gyro.Magnitude.Mean
44.	Freq.Body.Gyro.Magnitude.Mean.Freq
45.	Freq.Body.Gyro.Jerk.Magnitude.Mean
46.	Freq.Body.Gyro.Jerk.Magnitude.Mean.Freq
47.	Angle.Time.Body.Accelerometer.Mean.Gravity.
48.	Angle.Time.Body.Accelerometer.Jerk.Mean.Gravity.Mean.
49.	Angle.Time.Body.Gyro.Mean.Gravity.Mean.
50.	Angle.Time.Body.Gyro.Jerk.Mean.Gravity.Mean.
51.	Angle.X.Gravity.Mean.
52.	Angle.Y.Gravity.Mean.
53.	Angle.Z.Gravity.Mean.


## The Complete Standard Deviation Feature Name List (33):
The Tidy variable names are self explanitory and correspond to the explanation provided in the feature_info.txt file referenced above.  The Tidy variable names contain a few abbreviations since they were not ambiguous and helped keep the names as concise as possible but still intuitive to read and understand. 

The few abbreviations that remain are:
- Freq - Frequency
- Std - Standard Deviation
- Gyro - Gyroscope

*Note that all the original variables were normalized between [-1, 1] and are therefore unitless.*

1.	Time.Body.Accelerometer.Std_X
2.	Time.Body.Accelerometer.Std_Y
3.	Time.Body.Accelerometer.Std_Z
4.	Time.Gravity.Accelerometer.Std_X
5.	Time.Gravity.Accelerometer.Std_Y
6.	Time.Gravity.Accelerometer.Std_Z
7.	Time.Body.Accelerometer.Jerk.Std_X
8.	Time.Body.Accelerometer.Jerk.Std_Y
9.	Time.Body.Accelerometer.Jerk.Std_Z
10.	Time.Body.Gyro.Std_X
11.	Time.Body.Gyro.Std_Y
12.	Time.Body.Gyro.Std_Z
13.	Time.Body.Gyro.Jerk.Std_X
14.	Time.Body.Gyro.Jerk.Std_Y
15.	Time.Body.Gyro.Jerk.Std_Z
16.	Time.Body.Accelerometer.Magnitude.Std
17.	Time.Gravity.Accelerometer.Magnitude.Std
18.	Time.Body.Accelerometer.Jerk.Magnitude.Std
19.	Time.Body.Gyro.Magnitude.Std
20.	Time.Body.Gyro.Jerk.Magnitude.Std
21.	Freq.Body.Accelerometer.Std_X
22.	Freq.Body.Accelerometer.Std_Y
23.	Freq.Body.Accelerometer.Std_Z
24.	Freq.Body.Accelerometer.Jerk.Std_X
25.	Freq.Body.Accelerometer.Jerk.Std_Y
26.	Freq.Body.Accelerometer.Jerk.Std_Z
27.	Freq.Body.Gyro.Std_X
28.	Freq.Body.Gyro.Std_Y
29.	Freq.Body.Gyro.Std_Z
30.	Freq.Body.Accelerometer.Magnitude.Std
31.	Freq.Body.Accelerometer.Jerk.Magnitude.Std
32.	Freq.Body.Gyro.Magnitude.Std
33.	Freq.Body.Gyro.Jerk.Magnitude.Std 

