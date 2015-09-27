Codebook
========
Codebook was generated on 9/27/2015

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
subject          | ID the subject who performed the activity for each window sample. Its range is from 1 to 30.
activity         | Activity name
featture         | Feature: Original future code
featDomain       | Feature: Time domain signal or frequency domain signal (Time or Freq)
featInstrument   | Feature: Measuring instrument (Accelerometer or Gyroscope)
featAcceleration | Feature: Acceleration signal (Body or Gravity)
featVariable     | Feature: Variable (Mean or SD)
featJerk         | Feature: Jerk signal
featMagnitude    | Feature: Magnitude of the signals calculated using the Euclidean norm
featAxis         | Feature: 3-axial signals in the X, Y and Z directions (X, Y, or Z)
featAverage      | Feature: Average of each variable for each activity and each subject

Dataset structure
-----------------


```r
str(tidy)
```

```
## > str(tidy)
## 'data.frame':   11880 obs. of  11 variables:
##  $ subject         : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ activity        : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ feature         : chr  "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" "tBodyAcc-mean()-X" ...
##  $ featDomain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featInstrument  : Factor w/ 2 levels "Accelerometer",..: 1 1 1 1 1 1 1 1 1 1 ...
## $ featAcceleration: Factor w/ 3 levels NA,"Body","Gravity": 2 2 2 2 2 2 2 2 2 2 ...
##  $ featVariable    : Factor w/ 2 levels "Mean","SD": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featJerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featMagnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 1 1 1 1 ...
##  $ featAxis        : Factor w/ 4 levels NA,"X","Y","Z": 2 2 2 2 2 2 2 2 2 2 ...
##  $ value           : num  0.277 0.276 0.276 0.279 0.278 ...
## > 
```


Show the first 5 rows of the data table
----------------------------------------

```r
head(tidy, 5)
```
## > head(tidy, 5)
## subject activity           feature featDomain featInstrument
## 1       1  WALKING tBodyAcc-mean()-X       Time  Accelerometer
## 2       2  WALKING tBodyAcc-mean()-X       Time  Accelerometer
## 3       3  WALKING tBodyAcc-mean()-X       Time  Accelerometer
## 4       4  WALKING tBodyAcc-mean()-X       Time  Accelerometer
## 5       5  WALKING tBodyAcc-mean()-X       Time  Accelerometer
##   featAcceleration featVariable featJerk featMagnitude featAxis     value
## 1             Body         Mean     <NA>          <NA>        X 0.2773308
## 2             Body         Mean     <NA>          <NA>        X 0.2764266
## 3             Body         Mean     <NA>          <NA>        X 0.2755675
## 4             Body         Mean     <NA>          <NA>        X 0.2785820
## 5             Body         Mean     <NA>          <NA>        X 0.2778423
## > 
```
## END