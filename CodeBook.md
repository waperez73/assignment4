# Getting and Cleaning Data Course Project
### Coursera course 3

Codebook for the training and test set derived from the UCI Human Activity Recgonition Using Smart Phone Data Set.  This is the list of variable extracted from the mean and std measurements from the training and test sets and merge into a single set.
[original data can be found here link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

I used the features labels found in the features.txt file to create descriptive meaninfull variable names.

# Loading, cleaning and data merging procedures
Since the data is available online I decided to download the zip file and unzip it in the data sub-directory in the location od the main script (run_analysis.R).  The first step in the script is to check for the existance of the data folder.  If the data folder exist then I used the data files under the "UCI HAR Dataset" directory. 

## Step by Step run_analysis.R
    - Load the activity_labels.txt into a data.frame call activities_labels.  The data.frame contains two columns the code (1-5) and the activity name.
    - Load the features.txt into a data.frame.
    - Call the prepareTest(directory,rows) function in the script test.R
    - Call the prepareTraining(directory,rows) function in the script training.R
    - Use the rbind command to bind the training and test data sets
    - use the gsub command to clean-up the features names and used those as variable names

      Code to clean up the name
        `names<-gsub("\\()","",colnames(dataset)) #replace () with blank
         names<-gsub("\\(","-",names) #replace '(' with -
         names<-gsub(")","",names) #replace '(' with -
         names<-gsub(",","-",names) #replace ',' with '-'
         colnames(dataset)<-names # assign new names to dataset
        `
    - Arrange the data set by subject id 
    - use subsetting with the lapply function to calculate the mean and summarize the data set and create a tidy summarize data
      `dataset2<-dataset[,lapply(.SD,mean),by=list(subject,activity)]`
    - Write the resulting data sets to two separate files:
      > UCI-Tidy.csv - the data set of the all the mean and standard deviation observation only
      > UCI-Tidy-summarize.csv - Data set containing the average of each variable group by activity and subject
    
## Preparing the test data    
    1. Call the prepareTest(directory,rows) function in the script test.R
    2. Load the X_test.txt into a data.frame
    3. Load the subject_test.txt into a data.frame
    4. Load the Y_test.txt into a data.frame - activities
    5. Use the activities_labels to assign the correct name to each activity in the activities data.frame
       (activity<-activities_labels[activity$V1,])
    6. Assign column names to the test data.frame using in the features data.frame loaded in step above.
    7. Add a new column to the test data frame with the activity name (use cbind)
    8. Add another column with the subject ID (use cbind)
    9. Return a data.table with the test data set
    

## Preparing the training data    
    1. Call the prepareTraining(directory,rows) function in the script training.R
    2. Load the X_train.txt into a data.frame
    3. Load the subject_train.txt into a data.frame - the test subject 
    4. Load the Y_train.txt into a data.frame - activities
    5. Use the activities_labels to assign the correct name to each activity in the activities data.frame
       (activity<-activities_labels[activity$V1,])
    6. Assign column names to the test data.frame using in the features data.frame loaded in step above.
    7. Add a new column to the test data frame with the activity name (use cbind)
    8. Add another column with the subject ID (use cbind)
    9. Return a data.table with the training data set
    
 
## Variable names
- Column 1 (subject): come from the files subject_train.txt and subject_test.txt.
- Column 2 (activity): come from the files Y_train.txt and Y_test.txt to assign the label I created a data.frame from the activity_labels.txt file and used the number in the activity as index to the extract the labels.
- Columns 3 to 88: Used the features.txt file to assign column names to the data.frame and used gsub to clean up the names. explained above

### Variables
    1	  subject
    2	  activity
    3	  tBodyAcc-mean-X
    4	  tBodyAcc-mean-Y
    5	  tBodyAcc-mean-Z
    6	  tBodyAcc-std-X
    7	  tBodyAcc-std-Y
    8	  tBodyAcc-std-Z
    9	  tGravityAcc-mean-X
    10	tGravityAcc-mean-Y
    11	tGravityAcc-mean-Z
    12	tGravityAcc-std-X
    13	tGravityAcc-std-Y
    14	tGravityAcc-std-Z
    15	tBodyAccJerk-mean-X
    16	tBodyAccJerk-mean-Y
    17	tBodyAccJerk-mean-Z
    18	tBodyAccJerk-std-X
    19	tBodyAccJerk-std-Y
    20	tBodyAccJerk-std-Z
    21	tBodyGyro-mean-X
    22	tBodyGyro-mean-Y
    23	tBodyGyro-mean-Z
    24	tBodyGyro-std-X
    25	tBodyGyro-std-Y
    26	tBodyGyro-std-Z
    27	tBodyGyroJerk-mean-X
    28	tBodyGyroJerk-mean-Y
    29	tBodyGyroJerk-mean-Z
    30	tBodyGyroJerk-std-X
    31	tBodyGyroJerk-std-Y
    32	tBodyGyroJerk-std-Z
    33	tBodyAccMag-mean
    34	tBodyAccMag-std
    35	tGravityAccMag-mean
    36	tGravityAccMag-std
    37	tBodyAccJerkMag-mean
    38	tBodyAccJerkMag-std
    39	tBodyGyroMag-mean
    40	tBodyGyroMag-std
    41	tBodyGyroJerkMag-mean
    42	tBodyGyroJerkMag-std
    43	fBodyAcc-mean-X
    44	fBodyAcc-mean-Y
    45	fBodyAcc-mean-Z
    46	fBodyAcc-std-X
    47	fBodyAcc-std-Y
    48	fBodyAcc-std-Z
    49	fBodyAcc-meanFreq-X
    50	fBodyAcc-meanFreq-Y
    51	fBodyAcc-meanFreq-Z
    52	fBodyAccJerk-mean-X
    53	fBodyAccJerk-mean-Y
    54	fBodyAccJerk-mean-Z
    55	fBodyAccJerk-std-X
    56	fBodyAccJerk-std-Y
    57	fBodyAccJerk-std-Z
    58	fBodyAccJerk-meanFreq-X
    59	fBodyAccJerk-meanFreq-Y
    60	fBodyAccJerk-meanFreq-Z
    61	fBodyGyro-mean-X
    62	fBodyGyro-mean-Y
    63	fBodyGyro-mean-Z
    64	fBodyGyro-std-X
    65	fBodyGyro-std-Y
    66	fBodyGyro-std-Z
    67	fBodyGyro-meanFreq-X
    68	fBodyGyro-meanFreq-Y
    69	fBodyGyro-meanFreq-Z
    70	fBodyAccMag-mean
    71	fBodyAccMag-std
    72	fBodyAccMag-meanFreq
    73	fBodyBodyAccJerkMag-mean
    74	fBodyBodyAccJerkMag-std
    75	fBodyBodyAccJerkMag-meanFreq
    76	fBodyBodyGyroMag-mean
    77	fBodyBodyGyroMag-std
    78	fBodyBodyGyroMag-meanFreq
    79	fBodyBodyGyroJerkMag-mean
    80	fBodyBodyGyroJerkMag-std
    81	fBodyBodyGyroJerkMag-meanFreq
    82	angle-tBodyAccMean-gravity
    83	angle-tBodyAccJerkMean-gravityMean
    84	angle-tBodyGyroMean-gravityMean
    85	angle-tBodyGyroJerkMean-gravityMean
    86	angle-X-gravityMean
    87	angle-Y-gravityMean
    88	angle-Z-gravityMean
