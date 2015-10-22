---
title: "Codebook"
author: "John Swift"
date: "22/10/2015"
output: "output_table.txt"
---

## Project Description
The project is the course project from the "Getting and Cleaning Data" course on Coursera.

The project rubric:

"

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

"

###Collection of the raw data
The raw data was obtained from the source provided by Coursera:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data 
For more details on the data see the original source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy data file the raw data should be downloaded from the link supplied above, and the "UCI HAR Dataset" should be placed in the working directory. The R script from this repository "run_analysis.R" should then be ran, and the tidy data output will be supplied into the working directory in a file named "output_table.txt".

###Cleaning of the data
6 files from the raw data were loaded ("test/subject_test.txt", "test/X_test.txt", "test/y_test.txt", "train/subject_train.txt", "train/X_train.txt", "train/y_train.txt") containing subject information.

These files were then merged to associate subject and activity information with measurements, and to combine test and train data.

The "features.txt" file was then loaded and used determine which measurements were of means or standard deviations, this was taken to mean any feature containing the functions "mean()" or "std()", titles containing other references to mean were neglected. 

The "activity_labels.txt" file was loaded and used to label the activities. The names were converted to lower case.
The feature names were used to name the variable columns. The names were converted to lower case and the brackets were removed to make them easier to call. Further modifications were not performed to retain links to the original data descriptions.

Averages were then taken of each variable for each subject and activity combination and the outputs stored in a new table. Both long and wide formats were computed.

The wide format is then outputted to a file named "output_table.txt". Wide was selected as discussion board conversations indicated this was more widely understood to meet the tidy data principles.

The output corresponds to the 4 tidy data principles, namely: 

1) One variable per column;

2) Each observation in a different row;

3) One table for each kind of variable;

4) Multiple tables should include a linking column (this last one is moot).


##Description of the variables in the output_table.txt file
The table contains 68 columns and 180 rows.

The first column "subject" contains integers representing the test subject (from 1-30). 

The second column "activity" contains a string indicating which of the 6 activities the subject was performing one of "walking",  "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying". 

The subsequent 66 columns contain numerical averages of mean() and std() variation functions from the original data set. The headings are explained in the original data description and quoted here:

"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

"

##Sources

The Coursera "Getting and Cleaning Data" course facilities (video lectures, discussion boards, links etc.)

Template for codebook: https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project guidance: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
