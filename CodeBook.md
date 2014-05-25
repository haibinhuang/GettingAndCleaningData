Code Book
=========

### Overview

**180 obs. of 68 variables data frame in txt format**

### Column 1: subject
**integer**
1:30, id for subjects participated in this study.

### Column 2: activity
**character**
"walking", "walking.upstairs","walking.downstairs","sitting","standing","laying". Activities the subjects are doing when the data are collected.

### Columns 3-68:
* average.of.tbodyacc.mean.x          
* average.of.tbodyacc.mean.y          
* average.of.tbodyacc.mean.z          
* average.of.tbodyacc.std.x           
* average.of.tbodyacc.std.y           
* average.of.tbodyacc.std.z           
* average.of.tgravityacc.mean.x       
* average.of.tgravityacc.mean.y       
* average.of.tgravityacc.mean.z       
* average.of.tgravityacc.std.x        
* average.of.tgravityacc.std.y        
* average.of.tgravityacc.std.z        
* average.of.tbodyaccjerk.mean.x      
* average.of.tbodyaccjerk.mean.y      
* average.of.tbodyaccjerk.mean.z      
* average.of.tbodyaccjerk.std.x       
* average.of.tbodyaccjerk.std.y       
* average.of.tbodyaccjerk.std.z       
* average.of.tbodygyro.mean.x         
* average.of.tbodygyro.mean.y         
* average.of.tbodygyro.mean.z         
* average.of.tbodygyro.std.x          
* average.of.tbodygyro.std.y          
* average.of.tbodygyro.std.z          
* average.of.tbodygyrojerk.mean.x     
* average.of.tbodygyrojerk.mean.y     
* average.of.tbodygyrojerk.mean.z     
* average.of.tbodygyrojerk.std.x      
* average.of.tbodygyrojerk.std.y      
* average.of.tbodygyrojerk.std.z      
* average.of.tbodyaccmag.mean         
* average.of.tbodyaccmag.std          
* average.of.tgravityaccmag.mean      
* average.of.tgravityaccmag.std       
* average.of.tbodyaccjerkmag.mean     
* average.of.tbodyaccjerkmag.std      
* average.of.tbodygyromag.mean        
* average.of.tbodygyromag.std         
* average.of.tbodygyrojerkmag.mean    
* average.of.tbodygyrojerkmag.std     
* average.of.fbodyacc.mean.x          
* average.of.fbodyacc.mean.y          
* average.of.fbodyacc.mean.z          
* average.of.fbodyacc.std.x           
* average.of.fbodyacc.std.y           
* average.of.fbodyacc.std.z           
* average.of.fbodyaccjerk.mean.x      
* average.of.fbodyaccjerk.mean.y      
* average.of.fbodyaccjerk.mean.z      
* average.of.fbodyaccjerk.std.x       
* average.of.fbodyaccjerk.std.y       
* average.of.fbodyaccjerk.std.z       
* average.of.fbodygyro.mean.x         
* average.of.fbodygyro.mean.y         
* average.of.fbodygyro.mean.z         
* average.of.fbodygyro.std.x          
* average.of.fbodygyro.std.y          
* average.of.fbodygyro.std.z          
* average.of.fbodyaccmag.mean         
* average.of.fbodyaccmag.std          
* average.of.fbodybodyaccjerkmag.mean 
* average.of.fbodybodyaccjerkmag.std  
* average.of.fbodybodygyromag.mean    
* average.of.fbodybodygyromag.std     
* average.of.fbodybodygyrojerkmag.mean
* average.of.fbodybodygyrojerkmag.std 

**numeric**

Averages of mean value and standard variation of the measurements (details below). 

These data come from the accelerometer and gyroscope 3-axial raw signals tacc.xyz and tgyro.xyz. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc.xyz and tgravityacc.xyz) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tbodyaccjerk.xyz and tbodygyrojerk.xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Then a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc.xyz, fbodyaccjerk.xyz, fbodygyro.xyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.xyz' is used to denote 3-axial signals in the x, y and z directions.

mean: mean value of above measurement.
std: Standard deviation of above measurement.

Procedure
=========

### 1. Download and unzip file
* [Data file URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Download file. 
  Script: 
  - fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  - download.file(fileUrl, destfile="./getdata_projectfiles_UCI HAR Dataset.zip", mode = "wb")
* unzip file. 
  Script: 
  - unzip("./getdata_projectfiles_UCI HAR Dataset.zip.zip")

### 2. Read in data
* Read in features (file: UCI HAR Dataset/features.txt). This is the name of measurements that correspond to each column of data in X_test.txt and X_train.txt. A little clean up of   the names by removing "()", replacing "-" and "," with ".". Script:
  - features <- read.table("./UCI HAR Dataset/features.txt")[,2]
  - features <- gsub("\\(\\)", "", features)
  - features <- gsub("-", ".", features)
  - features <- gsub(",", ".", features)
  
* Read in test data set
   + Read in test data (UCI HAR Dataset/test/X_test.txt) using above features as column names. 
     Script: 
     - testset <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features)
   + Read in subject data (UCI HAR Dataset/test/subject_test.txt) corresponding to above test data (only the second column data were used) with "subject" as column name.
     Script: 
     - testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
   + Read in activity data (UCI HAR Dataset/test/y_test.txt) corresponding to above test data with "activity" as column name.
     Script: 
     - testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
   + Merge subject, activity and test data
     Script: 
     - testset <- cbind(testsubject, testactivity, testset)

* Read in train data set
   + Read in train data (UCI HAR Dataset/train/X_train.txt) using above features as column names. Script: 
     - trainset <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features)
   + Read in subject data (UCI HAR Dataset/train/subject_train.txt) corresponding to above train data (only the second column data were used) with "subject" as column name. Script: 
     - trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
   + Read in activity data (UCI HAR Dataset/train/y_train.txt) corresponding to above train data with "activity" as column name. Script: 
     - trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
   + Merge subject, activity and train data. Script: 
     - trainset <- cbind(trainsubject, trainactivity, trainset)

* Merge test data set and train data set
  Script: 
  - allset <- merge(testset, trainset, all=TRUE)

### 3. Clean up data
* Select columns related to mean and std of measurement
   + Select columns that contain "mean" or "std" in their column names
     Script: 
     - i <- grep("mean|std", colnames(allset))
   + Combine those columns with column subject and activity
     Script: 
     - meanandstd <- allset[, c(1,2,i)]
   + Remove columns that contain "meanFreq" since they don't have correspondin "std" column and are not the "mean" and "std" measurement we are looking at
     Script: 
     - j <- grep("meanFreq", colnames(meanandstd))
     - meanandstd <- meanandstd[, -j]
* Further clean up feature names (change to lower case)
  Script: 
  - colnames(meanandstd) <- tolower(colnames(meanandstd))
* Calculate the average of selected measurements
   + melt the data frame according to subject and activity
     Script: 
     - library(reshape2)
     - meltedmeanandstd <- melt(meanandstd, id.vars = c("subject", "activity"))
   + dcast the melted data frame according subject and activity and calculate the aggregated mean of other columns
     Script: 
     - meanandstdtidy <- dcast(meltedmeanandstd, subject + activity ~ variable, fun.aggregate = mean)
* Change the activity code to actural activity name
  Script:
  - meanandstdtidy$activity[meanandstdtidy$activity == "1"] <- "walking"
  - meanandstdtidy$activity[meanandstdtidy$activity == "2"] <- "walking.upstairs"
  - meanandstdtidy$activity[meanandstdtidy$activity == "3"] <- "walking.downstairs"
  - meanandstdtidy$activity[meanandstdtidy$activity == "4"] <- "sitting"
  - meanandstdtidy$activity[meanandstdtidy$activity == "5"] <- "standing"
  - meanandstdtidy$activity[meanandstdtidy$activity == "6"] <- "laying"
* Add "average.of." to the names of columns with measurements
  Script:
  - colnames(meanandstdtidy)[3:ncol(meanandstdtidy)] <- paste("average.of.", colnames(meanandstdtidy)[3:ncol(meanandstdtidy)], sep = "")
* Write the clean data table to text file
  Script: 
  - write.table(meanandstdtidy, file = "./humanactivitybysmartphone.txt")
 
