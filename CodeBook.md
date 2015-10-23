---
title: "Codebook"
author: "John Swift"
date: "22/10/2015"
output: "output_table.txt"
---

##Description of the variables in the output_table.txt file
The table contains 68 columns and 180 rows (representing 6 activities for 30 test subjects).

The first column "subject" contains integers representing the test subject (from 1-30). 

The second column "activity" contains a string indicating which of the 6 activities the subject was performing one of "walking",  "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying". 

The subsequent 66 columns contain numerical averages of mean() and std() variation functions from the original data set. The underlying data behind teh numerical averages were normalised so the values are bounded between -1 & +1.
The titles are composed of up to 4 elements:

1) A letter "t" or "f" which indicates whether the signals are time domain or Fast Fourier Transform (FFT).

2) Subsequently an identifying name for the variable describing the measure (e.g. "bodyacc" for body accelration).

3) Next, following a dash, either "mean" or "std" deviation to indicate the statistic in question.

4) In some cases for measures in 3 axial signals, following a further dash, either "x", "y" or "z" indicates the direction.

More details are provided in the "features_info.txt" file in the data-set and quoted below:

"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"

##Sources

The Coursera "Getting and Cleaning Data" course facilities (video lectures, discussion boards, links etc.)

Template for codebook: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project guidance: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
