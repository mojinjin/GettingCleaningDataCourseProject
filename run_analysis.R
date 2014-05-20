##set work directory

setwd("C:\\Users\\lenovo\\Desktop\\UCI HAR Dataset")

##read train and test set

X_train <- read.table(".\\train\\X_train.txt")
X_test <- read.table(".\\test\\X_test.txt")

##merging the training and the test sets to creat one data set named "mergedata"

mergedata <- rbind(X_train, X_test)

##read "features.txt" and add these corresponding features as column names to "mergedata" 

features <- read.table("features.txt")
names <- as.vector(features[,2])
colnames(mergedata) <- names


##Extracts only the measurements on the mean and standard deviation for each measurement 
##respectively.Permutate selected columns on the basis of the original order.Columns with 
##character strings of mean" or "std" in its column  names are retained in the data set 
##named "mergedata_selcol".

meancol <- grep("mean", names)
stdcol <- grep("std", names)
selcol <- sort(c(meancol, stdcol), decreasing = FALSE)
mergedata_selcol <- mergedata[,selcol]

##read subject information from "subject_train.txt" and "subject_test.txt".
##Merge two files with all subject information in a column.

subject_train <- read.table(".\\train\\subject_train.txt")
subject_test <- read.table(".\\test\\subject_test.txt")
subject <- rbind(subject_train, subject_test)

##read activity information from corresponding files and merge them with 
##all activity information in a column

y_train <- read.table(".\\train\\y_train.txt")
y_test <- read.table(".\\test\\y_test.txt")
activity <- rbind(y_train, y_test)

##merge subject and activity information first,which is joined with 
##dataset "mergedata_selcol". New dataset "sub_mergedata" has 10299 
##observations and 81 variables.

sub_info <- cbind(subject, activity)
colnames(sub_info) <- c("subject", "activity")
sub_mergedata <- cbind(sub_info, mergedata_selcol)

##Use descriptive activity names in the "activity_labels.txt" file
##to name the activities in the data set

sub_mergedata$activity <- factor(sub_mergedata$activity)
activity_labels <- read.table("activity_labels.txt")
levels(sub_mergedata$activity) <- list(WALKING = 1, WALKING_UPSTAIRS = 2, 
WALKING_DOWNSTAIRS = 3, SITTING = 4,  STANDING = 5, LAYING = 6)

##Creates an independent tidy data set "aggdata" with the average of each 
##variable for each activity and each subject. 

aggdata <-aggregate(sub_mergedata[-c(1,2)], by=list(sub_mergedata$subject,sub_mergedata$activity), FUN=mean,  na.rm=TRUE)
colnames(aggdata)[c(1,2)] <- c("subject", "activity")

##the independent tidy data set saved as "Course Project Data.txt" in the work directory. 
 
write.table(aggdata, file="Course Project Data.txt", quote=FALSE, sep = " ", row.names=F, col.names = T)