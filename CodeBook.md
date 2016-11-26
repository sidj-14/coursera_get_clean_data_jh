#Coursera Project – Getting and Cleaning Data
***

As per the guidelines, the raw data set for cleaning was downloaded as a zip file from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The data is used for “Human Activity Recognition”. This data is collected from smartphones. The dataset comprises of the readings of accelerometer and gyroscope for a group of 30 volunteers, each performing six activities. A time interval(window) of 2.56 sec was taken for sampling and data from these were recorded to calculate variables for the time and frequency domain. The information about the variables is available in the file “features_info.txt”. The files from the data set that were used are as follows:
* features.txt
* activity_labels.txt
* train/X_train.txt
* train/y_train.txt
* test/X_test.txt
* test/y_test.txt

The script does two things:
### * Combines the data set of “test” and “train”
Both the data set contains information about the 561 total variables mentioned in the “features.txt” for all the subjects respective to the test or the train group. The first part of the script merges the two datasets (test and train) and extracts out the observations only of the variables which contain the mean and standard deviation for each measurement. So the data corresponding to each subject’s, every activity’s mean and standard deviation reading. The total number of readings in the final dataset is 81 out of which first two are the subject id and activity label (which exercise is performed). 

### * Average of each variable for each activity and each subject
For this computation, the output dataset from the first was used. Basically, the average of each measurement was taken after making the groups based on activity label and subject id. This is same as making groups based on for example date of birth and gender. Then the mean was taken of the observations lying in the particular group for the whole grouped data to give out the final output dataset required containing average of each variable (mean and standard deviation) for each “activity label-subject” group.


The final 81 variables and their units are reported in the table below:

|S. No.|Variable Name	|Description	|Unit
|---|---|---|---
|1|Subject t_id	|Id given to the subjects whose measurements were taken	|integer
|2|activity_label|Activity type each subject was involved in. It was one of the following activities – WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|character
|3|subject_activity_measure_of_tBodyAcc-mean()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-mean()-X	|‘g’(standard gravity)
|4|subject_activity_measure_of_tBodyAcc-mean()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-mean()-Y	|‘g’(standard gravity)
|5|subject_activity_measure_of_tBodyAcc-mean()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-mean()-Z	|‘g’(standard gravity)
|6|subject_activity_measure_of_tBodyAcc-std()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-std()-X	|‘g’(standard gravity)
|7|subject_activity_measure_of_tBodyAcc-std()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-std()-Y	|‘g’(standard gravity)
|8|subject_activity_measure_of_tBodyAcc-std()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyAcc-std()-Z	|‘g’(standard gravity)
|9|subject_activity_measure_of_tGravityAcc-mean()-X	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-mean()-X	|‘g’(standard gravity)
|10|subject_activity_measure_of_tGravityAcc-mean()-Y	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-mean()-Y	|‘g’(standard gravity)
|11|subject_activity_measure_of_tGravityAcc-mean()-Z	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-mean()-Z	|‘g’(standard gravity)
|12|subject_activity_measure_of_tGravityAcc-std()-X	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-std()-X	|‘g’(standard gravity)
|13|subject_activity_measure_of_tGravityAcc-std()-Y	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-std()-Y	|‘g’(standard gravity)
|14|subject_activity_measure_of_tGravityAcc-std()-Z	|Average of all time domain values in the combination of an activity and a subject for tGravityAcc-std()-Z	|‘g’(standard gravity)
|15|subject_activity_measure_of_tBodyAccJerk-mean()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-mean()-X	|‘g’(standard gravity)
|16|subject_activity_measure_of_tBodyAccJerk-mean()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-mean()-Y	|‘g’(standard gravity)
|17|subject_activity_measure_of_tBodyAccJerk-mean()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-mean()-Z	|‘g’(standard gravity)
|18|subject_activity_measure_of_tBodyAccJerk-std()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-std()-X	|‘g’(standard gravity)
|19|subject_activity_measure_of_tBodyAccJerk-std()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-std()-Y	|‘g’(standard gravity)
|20|subject_activity_measure_of_tBodyAccJerk-std()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerk-std()-Z	|‘g’(standard gravity)
|21|subject_activity_measure_of_tBodyGyro-mean()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-mean()-X	|radians/second
|22|subject_activity_measure_of_tBodyGyro-mean()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-mean()-Y	|radians/second
|23|subject_activity_measure_of_tBodyGyro-mean()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-mean()-Z	|radians/second
|24|subject_activity_measure_of_tBodyGyro-std()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-std()-X	|radians/second
|25|subject_activity_measure_of_tBodyGyro-std()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-std()-Y	|radians/second
|26|subject_activity_measure_of_tBodyGyro-std()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyGyro-std()-Z	|radians/second
|27|subject_activity_measure_of_tBodyGyroJerk-mean()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerk-mean()-X	|radians/second
|28|subject_activity_measure_of_tBodyGyroJerk-mean()-Y	|Average of all time domain values in the combination of an activity and a subject tBodyGyroJerk-mean()-Y	|radians/second
|29|subject_activity_measure_of_tBodyGyroJerk-mean()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerk-mean()-Z	|radians/second
|30|subject_activity_measure_of_tBodyGyroJerk-std()-X	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerk-std()-X	|radians/second
|31|subject_activity_measure_of_tBodyGyroJerk-std()-Y	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerk-std()-Y	|radians/second
|32|subject_activity_measure_of_tBodyGyroJerk-std()-Z	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerk-std()-Z	|radians/second
|33|subject_activity_measure_of_tBodyAccMag-mean()	|Average of all time domain values in the combination of an activity and a subject for tBodyAccMag-mean()	|‘g’(standard gravity)
|34|subject_activity_measure_of_tBodyAccMag-std()	|Average of all time domain values in the combination of an activity and a subject for tBodyAccMag-std()	|‘g’(standard gravity)
|35|subject_activity_measure_of_tGravityAccMag-mean()	|Average of all time domain values in the combination of an activity and a subject for tGravityAccMag-mean()	|‘g’(standard gravity)
|36|subject_activity_measure_of_tGravityAccMag-std()	|Average of all time domain values in the combination of an activity and a subject for tGravityAccMag-std()	|‘g’(standard gravity)
|37|subject_activity_measure_of_tBodyAccJerkMag-mean()	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerkMag-mean()	|‘g’(standard gravity)
|38|subject_activity_measure_of_tBodyAccJerkMag-std()	|Average of all time domain values in the combination of an activity and a subject for tBodyAccJerkMag-std()	|‘g’(standard gravity)
|39|subject_activity_measure_of_tBodyGyroMag-mean()	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroMag-mean()	|radians/second
|40|subject_activity_measure_of_tBodyGyroMag-std()	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroMag-std()	|radians/second
|41|subject_activity_measure_of_tBodyGyroJerkMag-mean()	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerkMag-mean()	|radians/second
|42|subject_activity_measure_of_tBodyGyroJerkMag-std()	|Average of all time domain values in the combination of an activity and a subject for tBodyGyroJerkMag-std()	|radians/second
|43|subject_activity_measure_of_fBodyAcc-mean()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-mean()-X	|‘g’(standard gravity)
|44|subject_activity_measure_of_fBodyAcc-mean()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-mean()-Y	|‘g’(standard gravity)
|45|subject_activity_measure_of_fBodyAcc-mean()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-mean()-Z	|‘g’(standard gravity)
|46|subject_activity_measure_of_fBodyAcc-std()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-std()-X	|‘g’(standard gravity)
|47|subject_activity_measure_of_fBodyAcc-std()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-std()-Y	|‘g’(standard gravity)
|48|subject_activity_measure_of_fBodyAcc-std()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-std()-Z	|‘g’(standard gravity)
|49|subject_activity_measure_of_fBodyAcc-meanFreq()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-meanFreq()-X	|‘g’(standard gravity)
|50|subject_activity_measure_of_fBodyAcc-meanFreq()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-meanFreq()-Y	|‘g’(standard gravity)
|51|subject_activity_measure_of_fBodyAcc-meanFreq()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAcc-meanFreq()-Z	|‘g’(standard gravity)
|52|subject_activity_measure_of_fBodyAccJerk-mean()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-mean()-X	|‘g’(standard gravity)
|53|subject_activity_measure_of_fBodyAccJerk-mean()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-mean()-Y	|‘g’(standard gravity)
|54|subject_activity_measure_of_fBodyAccJerk-mean()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-mean()-Z	|‘g’(standard gravity)
|55|subject_activity_measure_of_fBodyAccJerk-std()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-std()-X	|‘g’(standard gravity)
|56|subject_activity_measure_of_fBodyAccJerk-std()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-std()-Y	|‘g’(standard gravity)
|57|subject_activity_measure_of_fBodyAccJerk-std()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-std()-Z	|‘g’(standard gravity)
|58|subject_activity_measure_of_fBodyAccJerk-meanFreq()-X|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-meanFreq()-X|‘g’(standard gravity)
|59|subject_activity_measure_of_fBodyAccJerk-meanFreq()-Y|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-meanFreq()-Y|‘g’(standard gravity)
|60|subject_activity_measure_of_fBodyAccJerk-meanFreq()-Z|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccJerk-meanFreq()-Z|‘g’(standard gravity)
|61|subject_activity_measure_of_fBodyGyro-mean()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-mean()-X|radians/second
|62 |subject_activity_measure_of_fBodyGyro-mean()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-mean()-Y	|radians/second
|63|subject_activity_measure_of_fBodyGyro-mean()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-mean()-Z	|radians/second
|64|subject_activity_measure_of_fBodyGyro-std()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-std()-X	|radians/second
|65|subject_activity_measure_of_fBodyGyro-std()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-std()-Y	|radians/second
|66|subject_activity_measure_of_fBodyGyro-std()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-std()-Z	|radians/second
|67 |subject_activity_measure_of_fBodyGyro-meanFreq()-X	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-meanFreq()-X	|radians/second
|68      |subject_activity_measure_of_fBodyGyro-meanFreq()-Y	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-meanFreq()-Y	|radians/second
|69      |subject_activity_measure_of_fBodyGyro-meanFreq()-Z	|Average of all frequency domain values in the combination of an activity and a subject for fBodyGyro-meanFreq()-Z	|radians/second
|70      |subject_activity_measure_of_fBodyAccMag-mean()	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccMag-mean()	|‘g’(standard gravity)
|71      |subject_activity_measure_of_fBodyAccMag-std()	|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccMag-std()|‘g’(standard gravity)
|72 |subject_activity_measure_of_fBodyAccMag-meanFreq()|Average of all frequency domain values in the combination of an activity and a subject for fBodyAccMag-meanFreq()	|‘g’(standard gravity)
|73|subject_activity_measure_of_fBodyBodyAccJerkMag-mean()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyAccJerkMag-mean()|‘g’(standard gravity)
|74      |subject_activity_measure_of_fBodyBodyAccJerkMag-std()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyAccJerkMag-std()|‘g’(standard gravity)
|75|subject_activity_measure_of_fBodyBodyAccJerkMag-meanFreq()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyAccJerkMag-meanFreq()|‘g’(standard gravity)
|76  |subject_activity_measure_of_fBodyBodyGyroMag-mean()	|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroMag-mean()	|radians/second
|77      |subject_activity_measure_of_fBodyBodyGyroMag-std()	|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroMag-std()	|radians/second
|78 |subject_activity_measure_of_fBodyBodyGyroMag-meanFreq()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroMag-meanFreq()|radians/second
|79|subject_activity_measure_of_fBodyBodyGyroJerkMag-mean()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroJerkMag-mean()|radians/second
|80|subject_activity_measure_of_fBodyBodyGyroJerkMag-std()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroJerkMag-std()|	radians/second
|81|subject_activity_measure_of_fBodyBodyGyroJerkMag-meanFreq()|Average of all frequency domain values in the combination of an activity and a subject for fBodyBodyGyroJerkMag-meanFreq()|	radians/second







##Information about the measurements (variables):

The features selected for this data gathering were extracted from the accelerometer and gyroscope 3-axial raw signals namely tAcc-XYZ and tGyro-XYZ. These signals were gathered from the accelerometer and the gyroscope at a constant rate of 50 Hz. Then a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz was used to remove noise (any unwanted aberrations). Post this the acceleration signals were then separated into body and gravity accelerations signals on all the three axes. Also, the jerk signals were made by calculating body linear acceleration and angular velocity in time. Now to get the frequency domain signals, a Fast Fourier Transform (FFT) was applied to some of these signals. The following signals were obtained from above procedure:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Further measurements were obtained by calculating the following functions on the above data:

* mean(): Mean value
* std(): Standard deviation
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
