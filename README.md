
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


##Where to install the run_analysis.R script 

Make sure the run_analysis.R script is also installed in your working directory.

##Linked scripts

The run_analysis script calls a couple of times a function included in a separate script file:
* install_load: checks whether a required package is installed. If not, he will first install the package and then load it. 

The install_load.R should also be included in your working directory.

So, your working directory contains:
* a data subdirectory 'UCI HAR dataset'
* two R scripts: run_analysis.R and install_load.R

##How to read the tidied dataset ?

tidied_dataset is the name of the tidied dataset we obtain in running the run_analysis.R script. In order to read in the tidied dataset use the command:

read.table(file="./tidied_dataset",sep="|",header=TRUE)

This dataset has 180 observations (30 subjects performing each 6 activities) and 69 variables. The variables are explained in the CodeBook.md file.  