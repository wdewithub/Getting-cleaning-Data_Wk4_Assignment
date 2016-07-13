#1. First download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#and unzip them to your working directory

#2. Read the 3 files of the test dataset and merge them together

##Read the subject file
subject_test <- read.table(file=".//UCI HAR Dataset/test/subject_test.txt",header=FALSE)
##Read the file with the 561 features. As reading a fixed width file with the read.fwf gave out
##of memory messages on a laptop with 4 GB of RAM, we prefer to used the fread function of the 
##data.table package. The install_load function checks whether the package is installed and loads
##the library.
fpath <- paste(getwd(),'/install_load.R',sep="")
source(fpath)
install_load("data.table")
x_test <- fread(input="./UCI HAR Dataset/test/X_test.txt", header=FALSE)
##Read the activity labels file
activities_test <- read.table(file=".//UCI HAR Dataset/test/y_test.txt",header=FALSE)
##Create a group variable indicating these are subjects in the test group
subject_test$group <- 'test'
##Merge the 3 files together. We use the cbind function as there are no common ID variables.
testgroup <- cbind(subject_test,activities_test,x_test)
##Check whether the merge has succeeded: 2947 observations and 564 variables
str(testgroup)
##Remove unnecessary objects from global environment
rm(activities_test, subject_test, x_test)

#3. Repeat step 2 with the 3 files of the training dataset 
##Read the 3 inputfiles
subject_train <- read.table(file=".//UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_train <- fread(input="./UCI HAR Dataset/train/X_train.txt", header=FALSE)
activities_train <- read.table(file=".//UCI HAR Dataset/train/y_train.txt",header=FALSE)
##Create a group variable indicating these are subjects in the test group
subject_train$group <- 'train'
##Merge the 3 files together. We use the cbind function as there are no common ID variables.
traingroup <- cbind(subject_train,activities_train,x_train)
##Check whether the merge has succeeded: 7352 observations and 564 variables
str(traingroup)
##Remove unnecessary objects from global environment
rm(activities_train, subject_train, x_train)

#4.Append the testgroup file to the traingroup file 
overall <- rbind(traingroup,testgroup)
##Perform some basic checks that append has succeeded:
  #a) test one has a file with 10299 obs and 564 var
str(overall)
  #b) check we have observations on 30 individuals
sort(unique(overall$V1))
##Remove unnecessary objects from global environment
rm(traingroup,testgroup)

#5.Extract only the measurements on the mean and standard deviation for each measurement


 