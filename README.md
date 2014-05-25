# Getting and Cleaning Data - Project
## README

* About Data
The data linked to from the course website represent data collected from 
the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


* Project - This coursera project converts the data into two tidy datasets:

merged_data.txt contains the mean and standard deviation of each measurement for all subjects and tests.
merged_data_summarized.txt contains the mean and standard deviation measurement for each subject/test combination.

1. First, unzip the data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and rename the folder to "uci".
The folder "uci" and the run_analysis.R script should be in the current working directory.

2.Write source("run_analysis.R") command in RStudio.

3.Find the two output files generated in the current working directory:
merged_data.txt: containing a data frame called dataClean.
merged_data_summarized.txt: containing a data frame called dataCleanAv.

4.Read the above text files into table to look at the data.

5.Use the CodeBook to read the analysis steps and variable names, selection.



