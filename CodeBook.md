Code book for Getting_and_Cleaning_data Course project - February 2015
=======================================================================
Detailed project instructions:
https://class.coursera.org/getdata-011/human_grading/view/courses/973498/assessments/3/submissions

## Study design
The date comes from experiment conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
<br>

For full credits and more detailed experiment description please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
<br>




The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## From raw data to tidy data instructions
The data cleaning and tiding process is coded as R script (file: run_analysis.R).
For instructions of using this script, please see README.md document.
<br/>
The output of the script is tidy_data.txt file.

## Code book
The structure of tidy_data.txt file:
* each row contains data for specific activity (column "activity_name") and subject ("Subject"). There are 30 subjects and 6 activities which gives 180 rows
* each column contains mean for a given activity/subject combination of measures such as mean(name of column includes "mean") or standard deviation (name of column inclused "std") of features described below. In other words the original dataset contained many means or std calculated for given subject and activity (eg. subejct 1 has many means and stds calculated for activity walking).The tidy dataset has summarised this means and std so for subject 1 and activity walking, there is only one row which contains means of means and std from the original dataset.


Note:
- data are normalized and bounded within [-1,1]
- data are in standard gravity units 'g'

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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


