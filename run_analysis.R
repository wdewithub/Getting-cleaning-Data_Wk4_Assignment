#1. First download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#and unzip them to your working directory

#2. Read the 3 files of the test dataset and merge them together

##Read the subject file
subject_test <- read.table(file=".//UCI HAR Dataset/test/subject_test.txt",header=FALSE)
##Read the file with the 561 features
x_test <- read.fwf(file="./UCI HAR Dataset/test/X_test.txt", widths=rep(16,561), header=FALSE)

   -- deze gaf op een laptop met 4GB RAM altijd out of memory fout -- probeer op een krachtigere PC (die van Dorien: R studio installeren ?)

##Read the activity labels file
activities_test <- read.table(file=".//UCI HAR Dataset/test/y_test.txt",header=FALSE)
##Merge the 3 files together
 