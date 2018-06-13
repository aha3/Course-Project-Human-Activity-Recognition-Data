# Codebook

This is the corresponding codebook for Coursera's Getting and Cleaning Data Project.

## Original Data

A full description of the original data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original Data can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Check the README.txt file for further details about this dataset. 

## R Script Description

The included R Script (run_analysis.R) contains all the code necessary to complete this project. 

It can be sourced and work properly, assuming the data is in one's working directory.

Please see the comments in the script for full explanation of steps.

## Tidy Data Description

The included tidy data set (TidyAverageData.txt) is a text file that contains the independent tidy data set with the average of each variable for each activity and each subject.

The variables included have been slightly modified from the original data to be more descriptive (e.g. V1 -> subjectID, t -> Time, f -> Frequency, std -> StandardDeviation etc.), and a full list is included below:



[1] "subjectID"                                       "activity"                                       
 [3] "Time_BodyAcc_Mean_X"                             "Time_BodyAcc_Mean_Y"                            
 [5] "Time_BodyAcc_Mean_Z"                             "Time_GravityAcc_Mean_X"                         
 [7] "Time_GravityAcc_Mean_Y"                          "Time_GravityAcc_Mean_Z"                         
 [9] "Time_BodyAccJerk_Mean_X"                         "Time_BodyAccJerk_Mean_Y"                        
[11] "Time_BodyAccJerk_Mean_Z"                         "Time_BodyGyro_Mean_X"                           
[13] "Time_BodyGyro_Mean_Y"                            "Time_BodyGyro_Mean_Z"                           
[15] "Time_BodyGyroJerk_Mean_X"                        "Time_BodyGyroJerk_Mean_Y"                       
[17] "Time_BodyGyroJerk_Mean_Z"                        "Time_BodyAccMag_Mean_"                          
[19] "Time_GravityAccMag_Mean_"                        "Time_BodyAccJerkMag_Mean_"                      
[21] "Time_BodyGyroMag_Mean_"                          "Time_BodyGyroJerkMag_Mean_"                     
[23] "Frequency_BodyAcc_Mean_X"                        "Frequency_BodyAcc_Mean_Y"                       
[25] "Frequency_BodyAcc_Mean_Z"                        "Frequency_BodyAcc_Mean_Freq_X"                  
[27] "Frequency_BodyAcc_Mean_Freq_Y"                   "Frequency_BodyAcc_Mean_Freq_Z"                  
[29] "Frequency_BodyAccJerk_Mean_X"                    "Frequency_BodyAccJerk_Mean_Y"                   
[31] "Frequency_BodyAccJerk_Mean_Z"                    "Frequency_BodyAccJerk_Mean_Freq_X"              
[33] "Frequency_BodyAccJerk_Mean_Freq_Y"               "Frequency_BodyAccJerk_Mean_Freq_Z"              
[35] "Frequency_BodyGyro_Mean_X"                       "Frequency_BodyGyro_Mean_Y"                      
[37] "Frequency_BodyGyro_Mean_Z"                       "Frequency_BodyGyro_Mean_Freq_X"                 
[39] "Frequency_BodyGyro_Mean_Freq_Y"                  "Frequency_BodyGyro_Mean_Freq_Z"                 
[41] "Frequency_BodyAccMag_Mean_"                      "Frequency_BodyAccMag_Mean_Freq"                 
[43] "Frequency_BodyBodyAccJerkMag_Mean_"              "Frequency_BodyBodyAccJerkMag_Mean_Freq"         
[45] "Frequency_BodyBodyGyroMag_Mean_"                 "Frequency_BodyBodyGyroMag_Mean_Freq"            
[47] "Frequency_BodyBodyGyroJerkMag_Mean_"             "Frequency_BodyBodyGyroJerkMag_Mean_Freq"        
[49] "angle(tBodyAcc_Mean_,gravity)"                   "angle(tBodyAccJerk_Mean_),gravity_Mean_)"       
[51] "angle(tBodyGyro_Mean_,gravity_Mean_)"            "angle(tBodyGyroJerk_Mean_,gravity_Mean_)"       
[53] "angle(X,gravity_Mean_)"                          "angle(Y,gravity_Mean_)"                         
[55] "angle(Z,gravity_Mean_)"                          "Time_BodyAcc_StandardDeviation_X"               
[57] "Time_BodyAcc_StandardDeviation_Y"                "Time_BodyAcc_StandardDeviation_Z"               
[59] "Time_GravityAcc_StandardDeviation_X"             "Time_GravityAcc_StandardDeviation_Y"            
[61] "Time_GravityAcc_StandardDeviation_Z"             "Time_BodyAccJerk_StandardDeviation_X"           
[63] "Time_BodyAccJerk_StandardDeviation_Y"            "Time_BodyAccJerk_StandardDeviation_Z"           
[65] "Time_BodyGyro_StandardDeviation_X"               "Time_BodyGyro_StandardDeviation_Y"              
[67] "Time_BodyGyro_StandardDeviation_Z"               "Time_BodyGyroJerk_StandardDeviation_X"          
[69] "Time_BodyGyroJerk_StandardDeviation_Y"           "Time_BodyGyroJerk_StandardDeviation_Z"          
[71] "Time_BodyAccMag_StandardDeviation"               "Time_GravityAccMag_StandardDeviation"           
[73] "Time_BodyAccJerkMag_StandardDeviation"           "Time_BodyGyroMag_StandardDeviation"             
[75] "Time_BodyGyroJerkMag_StandardDeviation"          "Frequency_BodyAcc_StandardDeviation_X"          
[77] "Frequency_BodyAcc_StandardDeviation_Y"           "Frequency_BodyAcc_StandardDeviation_Z"          
[79] "Frequency_BodyAccJerk_StandardDeviation_X"       "Frequency_BodyAccJerk_StandardDeviation_Y"      
[81] "Frequency_BodyAccJerk_StandardDeviation_Z"       "Frequency_BodyGyro_StandardDeviation_X"         
[83] "Frequency_BodyGyro_StandardDeviation_Y"          "Frequency_BodyGyro_StandardDeviation_Z"         
[85] "Frequency_BodyAccMag_StandardDeviation"          "Frequency_BodyBodyAccJerkMag_StandardDeviation" 
[87] "Frequency_BodyBodyGyroMag_StandardDeviation"     "Frequency_BodyBodyGyroJerkMag_StandardDeviation"

