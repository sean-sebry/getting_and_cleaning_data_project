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


#eda and treating of dataset
names <- colnames(tidy_full_data_set)
select_unique<-!duplicated(names)
tidy_treatment_1_data_set <- as.data.frame(tidy_full_data_set[,select_unique==TRUE])#removing duplicate columns
tidy_treatment_1_data_set <- tidy_treatment_1_data_set %>% rename(y_activity = y)#adding a more descriptive name to 'y'
activity_labels <- read_table(file = "/cloud/project/UCI HAR Dataset/activity_labels.txt",col_names = FALSE)#bringing in activity labels

tidy_treatment_2_data_set <- tidy_treatment_1_data_set %>%
  mutate(y_activity = case_when(
    y_activity == 1 ~ as.character(activity_labels[1, 2]),
    y_activity == 2 ~ as.character(activity_labels[2, 2]),
    y_activity == 3 ~ as.character(activity_labels[3, 2]),
    y_activity == 4 ~ as.character(activity_labels[4, 2]),
    y_activity == 5 ~ as.character(activity_labels[5, 2]),
    y_activity == 6 ~ as.character(activity_labels[6, 2])))
glimpse(tidy_treatment_2_data_set)


