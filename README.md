<<<<<<< HEAD
#README

##Before you run the run_analysis script

With the run_analysis.R script we tidied data collected from accelerometers from a Samsung Galaxy S smartphone for a group of 30 volunteers within an age bracket of 19-48 years. A full description of the experiment can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In order to run the script, one should:
* download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip them in your working directory

This will create a subdirectory 'UCI HAR Dataset' in your working directory with both a test and a train subdirectory. 
Both subdirectories contain the actual raw data we'll process with the run_analysis script. We will need the following 3 files in each subdirectory:
* subject_group file: each row identifies one of the 30 subjects who performed a certain activity. 
* X_group file: dataset with the 561 calculated features
* Y_group file: the labels of the acitivity performed

##Linked scripts

The run_analysis script calls functions included in separate script files:
=======
#README

##Before you run the run_analysis script

With the run_analysis.R script we tidied data collected from accelerometers from a Samsung Galaxy S smartphone for a group of 30 volunteers within an age bracket of 19-48 years. A full description of the experiment can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In order to run the script, one should:
* download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip them in your working directory

This will create a subdirectory 'UCI HAR Dataset' in your working directory with both a test and a train subdirectory. 
Both subdirectories contain the actual raw data we'll process with the run_analysis script. We will need the following 3 files in each subdirectory:
* subject_group file: each row identifies one of the 30 subjects who performed a certain activity. 
* X_group file: dataset with the 561 calculated features
* Y_group file: the labels of the acitivity performed

##Linked scripts

The run_analysis script calls functions included in separate script files:
>>>>>>> origin/master
* install_load: checks whether a required package is installed. If not, he will first install the package and then load it. 