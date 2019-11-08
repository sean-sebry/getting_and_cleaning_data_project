CODE BOOK FOR GETTING AND CLEANING DATA PROJECT
BY: S.SEBRY

VARIABLES:

x_test_df:
  bring in raw data for x test set
  assign variable names
  
name_for_x_test:
  bring in raw feature data for x test set
  
y_test_df:
  bring in raw activity names
  label column name as "y"  


subject_test_df:
  bring in raw subject numeric assignment
  lable column name as "subject"
  
comb_test_df:
  combined data set for test data

x_train_df:
  bring in raw data for x train set
  assign variable names
  
name_for_x_train:
  bring in raw feature data for x train set
  
y_train_df:
  bring in raw activity names
  label column name as "y"  

subject_train_df:
  bring in raw subject numeric assignment
  lable column name as "subject"
  
comb_train_df:
  combined data set for train data

tidy_full_data_set:
  combined train and test data
  with column names and no row names

names:
  column names in a vector to explore
  
tidy_treatment_1_data_set:
  remove duplicate columns
  rename "y" to "y_activity" to be more human-readable

activity_labels:
  bringing in activity labels

tidy_treatment_2_data_set:
  assign proper descriptive names to activities

tidy_treament_3_data_set:
  select columns for "std" and "mean" not case sensistive

tidy_data_set_final:
  final tidy data set

analysis:
  table grouped by "y_activity" and "subject" respectively

summary:
  final tidy summary data table for mean and standard deviations broken down
  by "y_activity" and "subject" respectively