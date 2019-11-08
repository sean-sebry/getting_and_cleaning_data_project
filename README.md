##GETTING AND CLEANING DATA PROJECT
##BY: S.SEBRY

###INTRODUCTION

Working in getting_and_cleaning_data_project.Rmd I loaded, explored, and iterated code to complete this task.  I referenced the course notes, forums, Hadley Wickham's Tidy Data, and the Thoughtful Bloke webpage.  

The final deliverables are the files:
  This - README.md
  CodeBook.md
  run_analysis.R
  summary_by_activity_and_subject_final.txt
  tidy_data_set_final.txt
  summary_by_activity_and_subject_final.csv
  tidy_data_set_final.csv
  

##WORKFLOW


1.  Bring in raw test and train data.  In each directory there was an x and y data set of equal row dimensions.  I combined these and had 2 data frames of train and test, with corrosponding activity and subject assignments

2.  Combine both the test and train data frames, and then do a couple data tidying treatments:
  -Remove duplicate columns
  -rename columns with more descriptive variables names
  -assign proper activity descriptors as characters as opposed to numeric indices
  -Select standard deviation and mean columns

3. Perform summary analysis on the final tidy set, and produce a new data table grouped and organized by activity and then subject.

4. Produce tables in text and cvs formats


NOTE: See code book for variable names and usage


###REFERENCES:
Tidy Data by Hadley Wickham
https://vita.had.co.nz/papers/tidy-data.pdf
Thoughtful Bloke Webpage
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/