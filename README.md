#Getting and Cleaning Data
***
This file explains the working of the script run_analysis.R.

##run_analysis.R – Explanation
***
The run_analysis.R script aims to perform the following tasks as per the project guidelines:

* STEP 1 - Merges the training and the test sets to create one data set
* STEP 2 - Extracts only the measurements on the mean and standard deviation for each * measurement
* STEP 3 - Uses descriptive activity names to name the activities in the data set
* STEP 4 - Appropriately labels the data set with descriptive names
* STEP 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The script has comments for easier understanding of how the code works. The flow is explained as follows:

1. In the start any dependent libraries are loaded. We use the library “**dplyr**” for the following functions used later in the script:
	* mutate()
	* group_by()
	* summarize_each()
2. Then the script checks whether a directory named “**Getting_&_Cleaning_Data**” exists and if it does not then the script creates the above-named directory.
3. The script then sets the working directory to the above mentioned file system.
4. The script now downloads the data from the link provided in the project information on the **_Coursera_** project page. The file is downloaded into a “_temp_” file from where it is unzipped into the current working directory. Post this step the script deletes the temporary file.
5. Now for reading the data, the script starts reading the concerned data sets
6. Firstly, the “*activity_labels.txt*” file is read which will be later used to change the integer values representing the activities to the descriptive activity names.
7. Then the script reads the file “*features.txt*” which contains the descriptive names of the features. This is stored in the variable “*features*” in which the second row of the data frame is the descriptive names. This second row is saved as a vector in a new variable called “*featuresNames*” which would be later used in the script to name the columns.
8. Now the script reads the “test” data set first. It reads all the necessary data required for merging”:
	* subject_test.txt – which contains the subject id for each observation in X_test.txt
	* X_test.txt – observations for each variable, activity and subject for the test group                                       (although the activity and subject columns are yet not present in the data but                                        are in same order as in the remaining two files)
	* y_test.txt –  integer values corresponding to the above two files, with each integer value                                        representing the activity. (The activity represented by the integer would be                                        later replaced by the descriptive name.)
9. Then a function(**changeToDescription()**) is written to make a new vector which has descriptive activity names referencing the integer values in “*test_y*” variable in the same order as in the file “**y_test.txt**”. Also, the script changes the output to data frame for easier manipulation. 
10. Further using the **mutate()** function from **dplyr** library we put in the two new columns of subject id and descriptive activity names in the **test_X** variable having the **X_test.txt** data. 
11. Now the script reads the train data set as it did the test data set:
                * subject_train.txt – which contains the subject id for each observation in **X_train.txt**
	*  X_train.txt – observations for each variable, activity and subject for the train group                                        (although the activity and subject columns are yet not present in the data                                         but are in same order as in the remaining two files)
	* y_train.txt –  integer values corresponding to the above two files, with each integer value                                         representing the activity. (The activity represented by the integer would be                                         later replaced by the descriptive name.)
12. Again the function(**changeToDescription()**) is used to make a new vector which has descriptive activity names referencing the integer values in “*train_y*” variable in the same order as in the file “**y_train.txt**”. Also, the script changes the output to data frame for easier manipulation.
13. Similar to step 10, the **mutate()** function is again used to make a new data frame for the train data similar to the test data.
14. Using **rbind()** we create the new data set asked for in the step 4 of the assignment but without the column names specified. 
15. The names extracted in the variable **featuresNames** described in point 7 along with names for the **subject id** and **activity description** is also put in. 
16. Now the script uses the grep command to get the index for subject_id column and activity label column from the vector given by **names()** function and the indices for the rows which have either *mean* or *std* in their name using the **grep()** command from the variable named **featuresNames** (This works as the observations in each raw data set is related to each other in the order they have been entered in.). These are stored in three different vectors which are later used to get the required data set asked for in **STEP 4** of the assignment.
17. Script now writes the result in a properly formatted txt file in the current working directory.
18. Now the script changes the name of the variables in the data set and adds the prefix **subject_activity_measure_of** as this is what is required in **STEP 5** of the assignment. 
19. To get the data for **STEP 5** firstly the script groups the tidy data set from **STEP 4** on a combined set of **subject_id** and **activity_label**. 
20. Then using the **summarize_each()** function from the **dplyr** library the mean of all the values lying under each group made above.
21. Script now writes the resulting data set in a properly formatted txt file in the current working directory. In the end script removes all the variables in the working space to make it clean.
22.  Both the txt files could be read using the command **read.csv(“file name”, header=TRUE)**

