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
##   select the first 3 ID variables + all variables that represent a mean or standard 
##   deviation of a measurement. This were all variables indicated in features.txt with a 
##   mean() or std() pattern in their name:
##     - the mean and std of the body acceleration in each of the 3 dimensions as measured from the accelerometer 
##     - the mean and std of the gravitational acceleration in each of the 3 dimensions as measured from the accelerometer
##     - the mean and std of the velocity in each of the 3 dimensions as measured from the gyroscope
##     - the Jerk signals for the body acceleration and velocity
##     - the magnitude of the above 3-dimension signals using the Euclidean norm
##     - the Fast Fourier transformation of all these
overall_sel <- select(overall,subjectid, group, activity, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, V201:V202,
                              V214:V215, V227:V228, V240:V241, V253:V254, V266:V271, V345:V350, V424:V429, V503:V504,
                              V516:V517, V529:V530, V542:V543) 
##Convert group and activity to a factor for later analysis purposes
overall_sel <- mutate(overall_sel,group=as.factor(group), activity=as.factor(activity)) 
##Replace the  labels of the activities by their names and check replacement with crosstable
table(overall_sel$activity)
overall_sel$activity <-recode(overall_sel$activity,'1'="walking", '2'="walking_upstairs", '3'="walking_downstairs", '4'="sitting", '5'="standing", '6'="laying")
table(overall_sel$activity)
##Give the variables appropriate names  
overall_sel <- rename(overall_sel, bodyacceleration_mean_x=V1, bodyacceleration_mean_y=V2, bodyacceleration_mean_z=V3, bodyacceleration_std_x=V4,
                      bodyacceleration_std_y=V5, bodyacceleration_std_z=V6, gravityacceleration_mean_x=V41, gravityacceleration_mean_y=V42,
                      gravityacceleration_mean_z=V43, gravityacceleration_std_x=V44, gravityacceleration_std_y=V45,
                      gravityacceleration_std_z=V46, bodyaccelerationjerk_mean_x=V81, bodyaccelerationjerk_mean_y=V82, bodyaccelerationjerk_mean_z=V83,
                      bodyaccelerationjerk_std_x=V84, bodyaccelerationjerk_std_y=V85, bodyaccelerationjerk_std_z=V86, velocity_mean_x=V121,
                      velocity_mean_y=V122, velocity_mean_z=V123, velocity_std_x=V124, velocity_std_y=V125, 
                      velocity_std_z=V126, velocityjerk_mean_x=V161, velocityjerk_mean_y=V162,  velocityjerk_mean_z=V163,
                      velocityjerk_std_x=V164, velocityjerk_std_y=V165,  velocityjerk_std_z=V166, bodyacceleration_mean_overall=V201, 
                      bodyacceleration_std_overall=V202, gravityacceleration_mean_overall=V214, gravityacceleration_std_overall=V215,  
                      bodyaccelerationjerk_mean_overall=V227, bodyaccelerationjerk_std_overall=V228, velocity_mean_overall=V240, velocity_std_overall=V241, 
                      velocityjerk_mean_overall=V253, velocityjerk_std_overall=V254, fourierbodyacceleration_mean_x=V266, fourierbodyacceleration_mean_y=V267, 
                      fourierbodyacceleration_mean_z=V268, fourierbodyacceleration_std_x=V269, fourierbodyacceleration_std_y=V270, fourierbodyacceleration_std_z=V271, fourierbodyaccelerationjerk_mean_x=V345,
                      fourierbodyaccelerationjerk_mean_y=V346, fourierbodyaccelerationjerk_mean_z=V347, fourierbodyaccelerationjerk_std_x=V348, fourierbodyaccelerationjerk_std_y=V349, fourierbodyaccelerationjerk_std_z=V350,
                      fouriervelocity_mean_x=V424, fouriervelocity_mean_y=V425, fouriervelocity_mean_z=V426, fouriervelocity_std_x=V427, fouriervelocity_std_y=V428, 
                      fouriervelocity_std_z=V429, fourierbodyacceleration_mean_overall=V503, fourierbodyacceleration_std_overall=V504, fourierbodyaccelerationjerk_mean_overall=V516, 
                      fourierbodyaccelerationjerk_std_overall=V517, fouriervelocity_mean_overall=V529, fouriervelocity_std_overall=V530, fouriervelocityjerk_mean_overall=V542, 
                      fouriervelocityjerk_std_overall=V543)

#7.Create a second independent tidy dataset with the average of each variable for each activity and each subject. First
#load the tidyr package to do so.
install_load("tidyr")
##All feature variables are first gathered into one column 'measurement'
sel_tidy <- gather(overall_sel,key=feature,value=value, -(subjectid:activity)) 
##Secondly:
##we calculate for each feature the average value by subjectid and activity. 
##after which we use the spread function to convert the features back into true variables
sel_tidy <- sel_tidy %>% group_by(subjectid, group, activity, feature) %>% summarize(average=mean(value)) %>% spread(key=feature,value=average)
##Thirdly, write the tidied dataset into a pipe separated flat file
write.table(x=sel_tidy,file="./tidied_dataset.txt",sep="|", col.names=TRUE, row.names=FALSE)
##Finally, clean up your memory in deleting overall and overall_sel
rm(overall, overall_sel)