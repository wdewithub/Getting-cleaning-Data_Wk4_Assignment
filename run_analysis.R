<<<<<<< HEAD
#1. First download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#and unzip them to your working directory

#2. Install the dplyr package for easy manipulation of the files. The install_load function checks 
#whether the package is installed and loads the library.
fpath <- paste(getwd(),'/install_load.R',sep="")
source(fpath)
install_load("dplyr")

#3. Read the 3 files of the test dataset and merge them together

##Read the subject file and rename V1 to subject
subject_test <- read.table(file=".//UCI HAR Dataset/test/subject_test.txt",header=FALSE)
subject_test <- rename(subject_test,subjectid=V1)
##Read the file with the 561 features. As reading a fixed width file with the read.fwf gave out
##of memory messages on a laptop with 4 GB of RAM, we prefer to used the fread function of the 
##data.table package. 
install_load("data.table")
x_test <- fread(input="./UCI HAR Dataset/test/X_test.txt", header=FALSE)
##Read the activity labels file and rename V1 to Activity
activities_test <- read.table(file=".//UCI HAR Dataset/test/y_test.txt",header=FALSE)
activities_test <- rename(activities_test,activity=V1)
##Create a group variable indicating these are subjects in the test group
subject_test$group <- 'test'
##Merge the 3 files together. We use the cbind function as there are no common ID variables.
testgroup <- cbind(subject_test,activities_test,x_test)
##Check whether the merge has succeeded: 2947 observations and 564 variables
str(testgroup)
##Remove unnecessary objects from global environment
rm(activities_test, subject_test, x_test)

#4. Repeat step 2 with the 3 files of the training dataset 
##Read the 3 inputfiles
subject_train <- read.table(file=".//UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject_train <- rename(subject_train,subjectid=V1)
x_train <- fread(input="./UCI HAR Dataset/train/X_train.txt", header=FALSE)
activities_train <- read.table(file=".//UCI HAR Dataset/train/y_train.txt",header=FALSE)
activities_train <- rename(activities_train,activity=V1)
##Create a group variable indicating these are subjects in the test group
subject_train$group <- 'train'
##Merge the 3 files together. We use the cbind function as there are no common ID variables.
traingroup <- cbind(subject_train,activities_train,x_train)
##Check whether the merge has succeeded: 7352 observations and 564 variables
str(traingroup)
##Remove unnecessary objects from global environment
rm(activities_train, subject_train, x_train)

#5.Append the testgroup file to the traingroup file 
overall <- rbind(traingroup,testgroup)
##Perform some basic checks that append has succeeded:
  #a) test one has a file with 10299 obs and 564 var
str(overall)
  #b) check we have observations on 30 individuals
sort(unique(overall$subject))
##Remove unnecessary objects from global environment
rm(traingroup,testgroup)

#6.Extract only the measurements on the mean and standard deviation for each measurement
##Make a relevant extraction:
##1. select the first 3 ID variables + all variables that represent a mean or standard 
##   deviation of a measurement. This were all variables indicated in features.txt with a 
##   mean() or std() pattern in their name.
overall_sel <- select(overall,subjectid, group, activity, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, 
                              V201:V202, V214:V215, V227:V228, V241:V242, V253:V254, V266:V271, V345:V350, 
                              V424:V429, V503:V504, V516:V517, V529:V530, V542:V543) 
##2. convert group and activity to a factor for later analysis purposes
overall_sel <- mutate(overall_sel,group=as.factor(group), activity=as.factor(activity)) 
##3. replace the  labels of the activities by their names and check replacement with crosstable
table(overall_sel$activity)
overall_sel$activity <-recode(overall_sel$activity,"1='walking'; 2='walking_upstairs'; 3='walking_downstairs'; 4='sitting'; 5='standing'; 6='laying'")
table(overall_sel$activity)
##4. give the variables appropriate names  

=======
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


 
>>>>>>> origin/master
