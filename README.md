GettingCleaningDataCourseProject
================================

peer assessment

R script attached aims to perform cleaning up the raw data. Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

First, set the work directory, here first code line in run_analysis.R shows my action making unzipping file as my work directory.

Second, run code in R, the script includes reading files and performing transformation as follows:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Finally, at the end of running code, a file named "Course Project Data.txt" is created in the work directory. 
