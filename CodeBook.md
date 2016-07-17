#Original data source

The original data source captured 3-axial angular velocity and 3-axial linear acceleration data collected from a Samsung Galaxy S II smartphone for a group of 30 volunteers within an age bracket of 19-48 years. 
Each volunteer performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing the smartphone on the waist. 70% of the volunteers was randomly
assigned to a training dataset, 30% to a test dataset.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

#Retained variables from data source

The subject, the activity they performed and the measurements for the 561 features were seperated over 3 files. Therefore, we first had to merge the 3 files for both the
training and the test group, after which we could append the merged files of the test group to the merged files of the training group. This gave us an overall file with 10299 observations
and 564 variables:
* the subjectid variable
* the group variable (test or train)
* the activity variable
* the 561 features measured

We then reduced this file to a new file of only 69 variables in select the first 3 variables as identification variables and selecting only the 66 features that represent a mean or standard 
deviation of a measurement. This were all variables  with a  mean() or std() pattern in their name:
* the mean and std of the body acceleration in each of the 3 dimensions as measured from the accelerometer 
* the mean and std of the gravitational acceleration in each of the 3 dimensions as measured from the accelerometer
* the mean and std of the velocity in each of the 3 dimensions as measured from the gyroscope
* the Jerk signals for the body acceleration and velocity
* the magnitude of the above 3-dimension signals using the Euclidean norm
* the Fast Fourier transformation of all these

#Manipulations on retained variables

As each individual had multiple measurements for each of the activities we calculated the average value for each of the 66 retained variables.

#Codebook

The final list of 66 variables are:

* bodyacceleration_mean_overall: average value of the mean body acceleration magnitude, tBodyAccMag_mean()
* bodyacceleration_mean_x/y/z: average value of the mean body acceleration in the x/y/z dimension, tBodyAcc_mean()-X/Y/Z
* bodyacceleration_std_overall: average value of the standard deviation of the body acceleration magnitude, tBodyAccMag_std()
* bodyacceleration_std_x/y/z: average value of the standard deviation of the body acceleration in the x/y/z dimension, tBodyAcc_mean()-X/Y/Z
* bodyaccelerationjerk_mean_overall: average value of the mean of the jerk signal of the body acceleration magnitude, tBodyAccJerkMag_mean()
* bodyaccelerationjerk_mean_x/y/z: average value of the mean of the jerk signal of the body acceleration in the x/y/z dimension, tBodyAccJerk_mean()-X/Y/Z
* bodyaccelerationjerk_std_overall: average value of the standard deviation of the jerk signal of the body acceleration magnitude, tBodyAccJerkMag_std()
* bodyaccelerationjerk_std_x/y/z: average value of the standard deviation of the jerk signal of the body acceleration in the x/y/z dimension, tBodyAccJerk_std()-X/Y/Z
* fourierbodyacceleration_mean_overall: average value of the mean of the fourier transformation on the body acceleration magnitude, fBodyAccMag-mean()
* fourierbodyacceleration_mean_x/y/z: average value of the mean of the fourier transformation on the body acceleration in the x/y/z dimension, fBodyAcc-mean()-X/Y/Z
* fourierbodyacceleration_std_overall: average value of the standard deviation of the fourier transformation on the body acceleration magnitude, fBodyAccMag-std()
* fourierbodyacceleration_std_x/y/z: average value of the standard deviation of the fourier transformation on the body acceleration in the x/y/z dimension, fBodyAcc-std()-X/Y/Z
* fourierbodyaccelerationjerk_mean_overall: average value of the mean of the fourier transformation on the jerk signals of the body acceleration magnitude, fBodyAccJerkMag-mean()
* fourierbodyaccelerationjerk_mean_x/y/z: average value of the mean of the fourier transformation on the jerk signals of the body acceleration in the x/y/z dimension, fBodyAccJerk-mean()-X/Y/Z
* fourierbodyaccelerationjerk_std_overall: average value of the standard deviation of the fourier transformation on the jerk signals of the body acceleration magnitude, fBodyAccJerkMag-std()
* fourierbodyaccelerationjerk_std_x/y/z: average value of the standard deviation of the fourier transformation on the jerk signals of the body acceleration in the x/y/z dimension, fBodyAccJerk-std()-X/Y/Z
* fouriervelocity_mean_overall: average value of the mean of the fourier transformation on the velocity magnitude, fBodyBodyGyroMag-mean()
* fouriervelocity_mean_x/y/z: average value of the mean of the fourier transformation on the velocity in the x/y/z dimension, fBodyGyro-mean()-X/Y/Z
* fouriervelocity_std_overall: average value of the standard deviation of the fourier transformation on the velocity magnitude, fBodyBodyGyroMag-std()
* fouriervelocity_std_x/y/z: average value of the standard deviation of the fourier transformation on the velocity  in the x/y/z dimension, fBodyGyro-std()-X/Y/Z
* fouriervelocityjerk_mean_overall: average value of the mean of the fourier transformation on the jerk signals of the velocity magniture, fBodyBodyGyroJerkMag-mean()
* fouriervelocityjerk_std_overall: average value of the standard deviation of the fourier transformation on the jerk signals of the velocity magniture, fBodyBodyGyroJerkMag-std()
* gravityacceleration_mean_overall: average value of the mean gravity acceleration magnitude, tGravityAccMag-mean()
* gravityacceleration_mean_x/y/z: average value of the mean gravity acceleration in the x/y/z dimension, tGravityAcc-mean()-X/Y/Z
* gravityacceleration_std_overall: average value of the standard deviation of gravity acceleration magnitude, tGravityAccMag-std()
* gravityacceleration_std_x/y/z: average value of the standard deviation of gravity acceleration in the x/y/z dimension, tGravityAcc-std()-X/Y/Z
* velocity_mean_overall: average value of the mean velocity magnitude, tBodyGyroMag-mean()
* velocity_mean_x/y/z: average value of the mean velocity in the x/y/z dimension, tBodyGyro-mean()-X/Y/Z
* velocity_std_overall: average value of the standard deviation of the velocity magnitude, tBodyGyroMag-std()
* velocity_std_x/y/z: average value of the standard deviation of the velocity in the x/y/z dimension, tBodyGyro-std()-X/Y/Z
* velocityjerk_mean_overall: average value of the mean of the jerk signal of the velocity magnitude, tBodyGyroJerkMag-mean()
* velocityjerk_mean_x/y/z: average value of the mean of the jerk signal of the velocity in the x/y/z dimension, tBodyGyroJerk-mean()-X/Y/Z
* velocityjerk_std_overall: average value of the standard deviation of the jerk signal of the velocity magnitude, tBodyGyroJerkMag-std()
* velocityjerk_std_x/y/z: average value of the standard deviation of the jerk signal of the velocity in the x/y/z dimension, tBodyGyroJerk-std()-X/Y/Z 

