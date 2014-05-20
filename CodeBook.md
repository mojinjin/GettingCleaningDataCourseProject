Course Project: CodeBook
================================================================================================

***Source of Data***

Source data "Human Activity Recognition Using Smartphones Dataset(Version 1.0)" for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Details about the source data is available at the site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

***Description about Data***

Total 30 subjects wearing a smartphone (Samsung Galaxy S II) on the waist carried out the experiments.Each person performed six activities including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.Sensor was used to obtain the raw data.Dataset has been randomly splitted into training data with 21 subjects and test dataset with 9 subjects.Finally, 561 features was obtained by calculating.

Now a second,independent tidy data set only with the average of each variable for each activity and each subject was created.

***Cleaning Up the Data***

*run_analysis.R* attached performs the process of cleaning up the data:

1.Merges the training and test sets to create one data set

Merged dataset named "mergedata" is a data frame with 10299 observations and 561 variables.

2.Read "features.txt" and add these corresponding features as column names to "mergedata" 

Now "mergedata" has features as its column names.

3.Extracts only the measurements on the mean and standard deviation for each measurement.

Total 79 variables were selected in dataset "mergedata_selcol"."subject_train.txt" and "subject_test.txt" were merged with 10299 observations and 1 variables as well as "y_train.txt" and "y_test.txt". Then subject and activity information were joined with "mergedata_selcol".New dataset named "sub_mergedata" has 10299 observations and 81 variables.

4.Use descriptive activity names to name the activity in the data set

Read "activity_labels.txt" that shows six activities including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. Apply these descriptive activity names to label variable "activity".

5.Creat a second,independent tidy data set with the average of each variable for each subject and each activity

Calculation of average of each variable for each subject and each activity was performed and results in a data set named "aggdata".Rename the column 1 and 2.Dataset "aggdata" has 180 observations and 81 variables.Finally,use function "write.table" saving the new tidy dataset as "Course Project Data.txt" in the work directory.

***Variables in Tidy Dataset***

Illustrate variable as follows:

- Column 1 subject: int, showing subject ID from 1 to 30

- Column 2 activity: factor,6 levels, descriptive activity 

Total 30 subjects and 6 activities per subject, so tidy dataset has 180 rows.In the experiment,signals(names as follows) were used to estimate variables of the feature vector for each pattern:"-XYZ"is used to denote 3-axial signals in the X, Y and Z directions.

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

- Column 3 ~ 81: 79 variables were estimated from the signals above:

mean(): Mean value

std(): Standard deviation

meanFreq(): Weighted average of the frequency components to obtain a mean frequency
