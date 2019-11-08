library(dplyr)
library(readr)
library(tibble)

#test data set
x_test_df <- read_table(file = "/cloud/project/UCI HAR Dataset/test/X_test.txt",col_names = FALSE)
name_for_x_test <- read_delim("/cloud/project/UCI HAR Dataset/features.txt"," ",col_names = FALSE)
colnames(x_test_df)<- name_for_x_test$X2
y_test_df <- read_table(file = "/cloud/project/UCI HAR Dataset/test/y_test.txt",col_names = FALSE)
colnames(y_test_df)<- "y"
subject_test_df <- read_table(file = "/cloud/project/UCI HAR Dataset/test/subject_test.txt",col_names = FALSE)
colnames(subject_test_df)<- "subject"
comb_test_df <- cbind.data.frame(subject_test_df,y_test_df,x_test_df)

#train data set
x_train_df <- read_table(file = "/cloud/project/UCI HAR Dataset/train/X_train.txt",col_names = FALSE)
name_for_x_train <- read_delim("/cloud/project/UCI HAR Dataset/features.txt"," ",col_names = FALSE)
colnames(x_train_df)<- name_for_x_train$X2
y_train_df <- read_table(file = "/cloud/project/UCI HAR Dataset/train/y_train.txt",col_names = FALSE)
colnames(y_train_df)<- "y"
subject_train_df <- read_table(file = "/cloud/project/UCI HAR Dataset/train/subject_train.txt",col_names = FALSE)
colnames(subject_train_df)<- "subject"
comb_train_df <- cbind.data.frame(subject_train_df,y_train_df,x_train_df)

#combine for tidy data set
tidy_full_data_set <- rbind(comb_test_df, comb_train_df)
glimpse(tidy_full_data_set)

#eda and treating of dataset, first pass
names <- colnames(tidy_full_data_set) %>% print()
unique(names)#Seems to have duplicates
select_unique<-!duplicated(names)
select_unique
tidy_treated_data_set <- as.data.frame(tidy_full_data_set[,select_unique==TRUE])#removing duplicate columns
tidy_treated_data_set <- tidy_treated_data_set %>% rename(y_activity = y)#adding a more descriptive name to 'y'



#Apply activity labels
activity_labels <- read_table(file = "/cloud/project/UCI HAR Dataset/activity_labels.txt",col_names = FALSE)


activity_labels