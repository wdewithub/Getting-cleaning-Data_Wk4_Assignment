#README

##Before you run the run_analysis script

With the run_analysis.R script we tidied data collected from accelerometers from a Samsung Galaxy S smartphone for a group of 30 volunteers within an age bracket of 19-48 years. A full description of the experiment can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In order to run the script, one should:
* download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip them in your working directory

This will create a subdirectory 'UCI HAR Dataset' in your working directory with the following file structure:
* test subdirectory
* train subdirectory
* activity_labels: labels for the activities 
* features: list of all features collected from the accelerometers
* features_info: shows information about the variables used on the feature vector
* README 

Both the test and train subdirectory contain the actual raw data we'll process with the run_analysis script. The contents of each subdirectory:
* Inertial Signals subdirectory
* subject_<group> file where group is either test or train: each row identifies one of the 30 subjects who performed a certain activity. 
* X_<group> file: feature dataset 
* Y_<group> file: activity labels

##