# Getting and Cleaning Data Course Project


##############################

# 1. Merge the training and the test sets to create one data set.

# load train data

x_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")

  # 7352 obsversation of 561 variables 
  # training set

# load train labels

y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt")

  # 7352 obsversation of 1 variable
  # training labels (activity, values 1-6)

# load train subect ID

subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")

  # 7352 obsversation of 1 variable 
  # Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


# load test data

x_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")

  # 2947 observations of 561 variables
  # test set

# load test labels

y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt")

  # 2947 observations of 1 variable
  # test labels (activity, values 1-6)

# load test subject ID

subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

  #2947 observations of 1 variable (ID)
  # Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


# load dplyr to merge tables

library(dplyr)

# merge train data (by column)

all_train <- bind_cols(subject_train, y_train, x_train)

  # 7352 obs. of 563 variables 
  # Note that the number of observations remains the same, and 2 variables have been added (subject ID and labels)

# merge test data (by column)

all_test <- bind_cols(subject_test, y_test, x_test)

  # 2947 obs. of 563 variables
  # note same behavior as all_train

# can now merge train and test data

all_data <- bind_rows(all_train, all_test) # can only bind rows when # of columns is equal

  # 10299 obs. of 563 variables
  # note that variables stay the same, and observations equal to sum of train and test data

class(all_data)

# convert all_data from data.frame to tbl_df class (will be easier to manipulate using dplyr)

all_data <- tbl_df(all_data)

class(all_data)


##############################

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# need to load the features (a.k.a. variables)

features <- read.table("data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE) 
  
  # stringsAsFactors = FALSE will make it possible to extract the elements in order to rename columns
  
  # 561 obs. of 2 variables (variable 1 is a useless number, variable 2 names 'feature')


# rename columns

colnames(all_data) <- c("subjectID", "activity", features[,2])


# remove duplicated columns (same measurements were repeated, but not those of interest, i.e. mean's sd's)

selected_data <- all_data[,!duplicated(colnames(all_data))]

  # reduced to 10299 obs. (same as before) and 479 variables 

unique(features[,2]) # there are 477 unique features (plus ID and activity, so 479 variables is correct)# select only measurements with mean and standard deviation


# select only measurements with mean and standard deviation

meanSD_data <- select(selected_data, subjectID, activity, contains("mean"), contains("std"))

  # Note that select() is not case sensitive (by default, but can be change with argument ignore.case = FALSE)

  # 10299 observations of 88 variables (53 mean variables, 33 std variables)


##############################

# 3. Use descriptive activity names to name the activities in the data set

  # i.e. rename activity values (1-6) to corresponding activity name (e.g. walking)

# load activity labels (names)

activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

  # 6 observations (acitivies) of 2 variables (2nd variable is of interest)

# rename columns of 'activity_labels'

colnames(activity_labels) <- c("activityID", "activity")

View(activity_labels) # checking renaming of columns

# apply descriptive activies to 'activity' column of meanSD_data

meanSD_data$activity <- factor(meanSD_data$activity,
                                  levels = c(1,2,3,4,5,6),
                                  labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

structure(meanSD_data$activity) # confirm that class is now factor, with descriptive labels


##############################

# 4.	Appropriately label the data set with descriptive variable names

# will use gsub() as needed...

colnames(meanSD_data) 
  
  # to seee current variable names

# remove unnecessary parantheses

colnames(meanSD_data) <- gsub("\\()", "", colnames(meanSD_data))

# replace beginning t and f with Time and Frequency, respectively

colnames(meanSD_data) <- gsub("^t", "Time_", colnames(meanSD_data))

colnames(meanSD_data) <- gsub("^f", "Frequency_", colnames(meanSD_data))

# remove all - and replace with _

colnames(meanSD_data) <- gsub("-", "_", colnames(meanSD_data))

# make 'mean' more pretty

colnames(meanSD_data) <- gsub("_mean", "_Mean", colnames(meanSD_data))

colnames(meanSD_data) <- gsub("mean", "Mean", colnames(meanSD_data))

colnames(meanSD_data) <- gsub("Mean", "Mean_", colnames(meanSD_data))

colnames(meanSD_data) <- gsub("Mean", "_Mean", colnames(meanSD_data))

colnames(meanSD_data) <- gsub("__", "_", colnames(meanSD_data))

# make standard deviation pretty

colnames(meanSD_data) <- gsub("std", "StandardDeviation", colnames(meanSD_data))

colnames(meanSD_data) # confirm descriptive variable names


##############################

#5.	From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyAverageData <- 
  meanSD_data %>% 
  group_by(subjectID, activity) %>% 
  summarize_all(mean) 
  
# write file to disk

write.table(TidyAverageData, "TidyAverageData.txt", row.names = FALSE)

list.files() # check to see it's there
