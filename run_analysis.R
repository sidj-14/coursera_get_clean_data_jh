## Loading the package
library(dplyr)

## Creating a new directory
if(!file.exists("Getting_&_Cleaning_Data")) dir.create("Getting_&_Cleaning_Data")

## Setting the working directory
directory_path <- setwd("./Getting_&_Cleaning_Data")

## Downloadinig the data and unzipping the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileUrl, destfile= temp)
unzip(temp)
unlink(temp)


## Reading the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Reading the features 
features <- read.table("./UCI HAR Dataset/features.txt")
featuresNames <- as.character(features$V2)

## READING TEST DATA

## Reading "subject_test" data
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Reading "X_test" data
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Reading "y_test" data
test_y <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Descriptive Activity Variable Name to be used hence changing 
## the numerals to the descriptive name from "activity_labels"

changeToDescription <- function(referenceVector, changingVector){
	changingVectorNew <- sapply(changingVector[[1]],as.character)
	charVector <- sapply(referenceVector$V2, as.character)
	intVector <- sapply(referenceVector$V1, as.character)
	newVector <- vector("character", length = length(changingVectorNew))
   for(i in 1:length(changingVectorNew)){
	if(changingVectorNew[i] == intVector[1]){
		newVector[i] <- charVector[1]
	 }else if(changingVectorNew[i] == intVector[2]){
		newVector[i] <- charVector[2]
	 }else if(changingVectorNew[i] == intVector[3]){
		newVector[i] <- charVector[3]
	 }else if(changingVectorNew[i] == intVector[4]){
		newVector[i] <- charVector[4]
	 }else if(changingVectorNew[i] == intVector[5]){
		newVector[i] <- charVector[5]
	 }else{
		newVector[i] <- charVector[6]}
   }
	return(newVector)
}

## getting the descriptive activity names and also changing to the data frame
activity_label_description_test <- as.data.frame(changeToDescription(activity_labels,test_y))

## Adding the columns containing subject id and descriptive activity labels in the test data set
test_X <- mutate(test_X, subject_id=(test_subject$V1), activity_label=activity_label_description_test[,1])

## READING TRAIN DATA

## Reading "subject_test" data
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Reading "X_test" data
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Reading "y_test" data
train_y <- read.table("./UCI HAR Dataset/train/y_train.txt")


## getting the descriptive activity names and also changing to the data frame
activity_label_description_train <- as.data.frame(changeToDescription(activity_labels,train_y))

## Adding the columns containing subject id and descriptive activity labels in the train data set
train_X <- mutate(train_X, subject_id=(train_subject$V1), activity_label=activity_label_description_train[,1])

## Rbind the two datasets
newDataSet <- rbind(test_X,train_X)

## Adding the column names
names(newDataSet) <- c(featuresNames,"subject_id","activity_label")

## Indices for subject_id and activity_label
subject_id_index <- grep("subject_id",names(newDataSet))
activity_label_index <- grep("activity_label",names(newDataSet))

## Mean and standard deviation indices extraction
mean_std_extraction <- grep("(mean|std)", featuresNames)

## Creating the final data set required in step 4
mean_std_data_set <- newDataSet[,c(subject_id_index,activity_label_index,mean_std_extraction)]

## saving the individual observation as csv file
write.table(mean_std_data_set,file="finalEachObservationData.csv", row.names=FALSE) 

## Changing the column names to the new names with prefix "subject_activity_measure_of_"
names_temp <- names(mean_std_data_set)
column3_onwards <- names_temp[3:length(names_temp)]
new_names_column3_onwards <- sapply(column3_onwards,function(x){paste("subject_activity_measure_of_",x[1],sep="")})
names(mean_std_data_set) <- c("subject_id","activity_label",new_names_column3_onwards)

## Grouping by subject_id and activity_label
grouped_data <- group_by(mean_std_data_set,subject_id,activity_label)
group_data_mean <- summarize_each(grouped_data,funs(mean))

## Turning it into a data frame
grouped_data_mean_df <- as.data.frame(group_data_mean)

## Writing the setp 5 dataset into a csv file
write.table(grouped_data_mean_df,file="finalMeanData.csv", row.names=FALSE) 


## Removing all the variables
rm(list=ls())