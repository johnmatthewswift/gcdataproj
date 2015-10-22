###########################################################################
##
## This script aims to fulfil the requirements of the course project for
## the Coursera course Getting & Cleaning Data. The starting point to run
## this script is to have downloaded and extracted the data such that the 
## "UCI HAR Dataset" folder is in the working directory.
##
## Author(s): John Swift
##
## Last update: 2015-10-22
##
###########################################################################


# Libraries ---------------------------------------------------------------
library(plyr)
library(dplyr)
library(tidyr)
library(reshape2)

# Section 1 - Merge Test & Train ------------------------------------------

# Get test data

subject_test <- read.table(
  file = './UCI HAR Dataset/test/subject_test.txt'
  )

X_test <- read.table(
  file = './UCI HAR Dataset/test/X_test.txt'
)

y_test <- read.table(
  file = './UCI HAR Dataset/test/y_test.txt'
)

# Get train data

subject_train <- read.table(
  file = './UCI HAR Dataset/train/subject_train.txt'
)

X_train <- read.table(
  file = './UCI HAR Dataset/train/X_train.txt'
)

y_train <- read.table(
  file = './UCI HAR Dataset/train/y_train.txt'
)

# Combine data-sets

merged_data <- rbind(
  cbind(subject_test, y_test, X_test),
  cbind(subject_train, y_train, X_train)
  )

# Section 2 - Extracts Mean & Standard Deviations -------------------------

# Get feature list
features <- read.table(
  file = './UCI HAR Dataset/features.txt'
)

# Get indices of features which correspond to "mean()" or "std()" functions
f_indices <- grep('mean\\(\\)|std\\(\\)', features[,2])

# Determine cols to keep - 
# i.e. first 2 with subject & activity info, and those selected offset by 2
to_keep <- c(1,2, (f_indices+2))

# Extract this data
extracted_data <- merged_data[,to_keep]

# Section 3 - Set descriptive activity names ------------------------------

# Get activity list
activities <- read.table(
  file = './UCI HAR Dataset/activity_labels.txt'
)

# set to lower case
activities <- sapply(activities, tolower)

# Set class of activiy column to factor
extracted_data[,2] <- as.factor(extracted_data[,2])

# Set factor levels to activity names
levels(extracted_data[,2]) <- activities[,2]


# Section 4 - Set variable names ------------------------------------------

# Get names from features and convert to lower case
feature_names <- tolower(as.character(features[f_indices,2]))

# Remove all brackets from names
feature_names <- gsub('[()]', '', feature_names)

# Use "subject", "activity" and then use names derived from features
var_names <- c('subject', 'activity', feature_names)

names(extracted_data) <- var_names


# Section 5 - Create new data set -----------------------------------------

# Melt data to long format to allow ddply to take means
melted_data <- melt(extracted_data, id = c('subject', 'activity'))

# Calculate means and form output
long_output <- ddply(melted_data,
                      .(subject, activity, variable), 
                      summarize, 
                      mean = mean(value)
                      )

# Spread to wide format for easier understanding
wide_output <- spread(long_output, variable, mean)

# Write output table to a text file in the working directory
write.table(wide_output, './output_table.txt', quote = FALSE, row.names = FALSE)
