# Getting and Cleaning Data - Project 
## CodeBook

*Steps performed in run_analysis.R
1. Read text files into tables
	X_train into dataTrain
	y_train into labelTrain
	subject_train into subjectTrain
	X_test into dataTest
	y_test into labelTest
	subject_test into subjectTest
	
2. Merge training and test data
	concatenate by rows dataTrain and DataTest into dataframe joinData
	concatenate by rows labelTrain and labelTest into dataframe joinLabel
	concatenate by rows subjectTrain and subjectTest into dataframe joinSubject
	
3. Extract and clean variables in features
	read text file features into table features
	extract only mean and standard variation variables
	update joinData to have the above selection
	Clean up variable names
		remove parentheses
		capitalize M in mean
		capitalize S in std
		remove hyphen
		expand prefix t to time
		expand prefix f to freq
		expand abreviation Acc to Acceleration
		expand abreviation Mag to Magnitude
		
4. Extract and cleanup activity variable values
	read activity text file into table activity
	cleanup-
		remove hyphen
		make all values lowercase
		capitalize first letter of second word
	add activity column (named 'activity') to joinLabel
	name joinSunject 'subject'

5. merge cleaned data
	concatenate by columns, dataframes - joinSubject, joinLabel and joinData
	write table into text file merged_data.txt
	
6. Read tidy dataset and summarize on subject and activity
	read text file merged_data.txt into table dataCleanAv
	set keys 'subject' and 'activity' in table dataCleanAv
	Calculate mean and standard deviation by keys
	write table into text file merged_data_summarized.txt
	
*Choice of variables
	Out of the original variables (listed at the end of this document)
	only mean and standards deviation veriables were selected for analysis

*Variables in the tidy dataset
subject                                   
activity                                 
timeBodyAccelerationMeanX                 
timeBodyAccelerationMeanY                
timeBodyAccelerationMeanZ                 
timeBodyAccelerationStdX                 
timeBodyAccelerationStdY                  
timeBodyAccelerationStdZ                 
timeGravityAccelerationMeanX              
timeGravityAccelerationMeanY             
timeGravityAccelerationMeanZ              
timeGravityAccelerationStdX              
timeGravityAccelerationStdY               
timeGravityAccelerationStdZ              
timeBodyAccelerationJerkMeanX             
timeBodyAccelerationJerkMeanY            
timeBodyAccelerationJerkMeanZ             
timeBodyAccelerationJerkStdX             
timeBodyAccelerationJerkStdY              
timeBodyAccelerationJerkStdZ             
timeBodyGyroMeanX                         
timeBodyGyroMeanY                        
timeBodyGyroMeanZ                         
timeBodyGyroStdX                         
timeBodyGyroStdY                          
timeBodyGyroStdZ                         
timeBodyGyroJerkMeanX                     
timeBodyGyroJerkMeanY                    
timeBodyGyroJerkMeanZ                     
timeBodyGyroJerkStdX                     
timeBodyGyroJerkStdY                      
timeBodyGyroJerkStdZ                     
timeBodyAccelerationMagnitudeMean         
timeBodyAccelerationMagnitudeStd         
timeGravityAccelerationMagnitudeMean      
timeGravityAccelerationMagnitudeStd      
timeBodyAccelerationJerkMagnitudeMean     
timeBodyAccelerationJerkMagnitudeStd     
timeBodyGyroMagnitudeMean                 
timeBodyGyroMagnitudeStd                 
timeBodyGyroJerkMagnitudeMean             
timeBodyGyroJerkMagnitudeStd             
freqBodyAccelerationMeanX                 
freqBodyAccelerationMeanY                
freqBodyAccelerationMeanZ                 
freqBodyAccelerationStdX                 
freqBodyAccelerationStdY                  
freqBodyAccelerationStdZ                 
freqBodyAccelerationJerkMeanX             
freqBodyAccelerationJerkMeanY            
freqBodyAccelerationJerkMeanZ             
freqBodyAccelerationJerkStdX             
freqBodyAccelerationJerkStdY              
freqBodyAccelerationJerkStdZ             
freqBodyGyroMeanX                         
freqBodyGyroMeanY                        
freqBodyGyroMeanZ                         
freqBodyGyroStdX                         
freqBodyGyroStdY                          
freqBodyGyroStdZ                         
freqBodyAccelerationMagnitudeMean         
freqBodyAccelerationMagnitudeStd         
freqBodyBodyAccelerationJerkMagnitudeMean 
freqBodyBodyAccelerationJerkMagnitudeStd 
freqBodyBodyGyroMagnitudeMean             
freqBodyBodyGyroMagnitudeStd             
freqBodyBodyGyroJerkMagnitudeMean         
freqBodyBodyGyroJerkMagnitudeStd  

##Original variables from reference documents
============================================
Feature Selection 
============================================

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were 
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag,
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

## Reference documents
The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for this project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

