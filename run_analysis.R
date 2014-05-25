## load reshap2
library(reshape2)

## download and unzip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./getdata_projectfiles_UCI HAR Dataset.zip",
              mode = "wb")
unzip("./getdata_projectfiles_UCI HAR Dataset.zip")

## read in features
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
## remove () in features
features <- gsub("\\(\\)", "", features)
## change "-" to "." in features
features <- gsub("-", ".", features)
## change "," to "." in features
features <- gsub(",", ".", features)

## read in test data set related subject
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                          col.names = "subject")
## read in test data set realted activity
testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                           col.names = "activity")
## read in test data set, set col names based on features
testset <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                      col.names = features)
## combine subject, activity and test data set
testset <- cbind(testsubject, testactivity, testset)

## read in train data set related subject
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                           col.names = "subject")
## read in train data set realted activity
trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                            col.names = "activity")
## read in train data set, , set col names based on features
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                       col.names = features)
## combine subject, activity and test data set
trainset <- cbind(trainsubject, trainactivity, trainset)

## merge test data set and train data set
allset <- merge(testset, trainset, all=TRUE)

## subset all data set to include only columns for means and stds 
## get index for columns with mean and std values
i <- grep("mean|std", colnames(allset))
## subsetting allset for columns of means and stds plus subject and activity
meanandstd <- allset[, c(1,2,i)]
## remove those columns containing meanFreq since they don't have 
## corresponding std values
## get index for columns containing meanFreq
j <- grep("meanFreq", colnames(meanandstd))
## remove those columns with with meanFreq
meanandstd <- meanandstd[, -j]

## change column names to lower case
colnames(meanandstd) <- tolower(colnames(meanandstd))

## melt meanandstd according to subject and activity
meltedmeanandstd <- melt(meanandstd, id.vars = c("subject", "activity"))

## dcast melted meanandstd and calculate aggregated mean
meanandstdtidy <- dcast(meltedmeanandstd, subject + activity ~ variable, 
                        fun.aggregate = mean)

## change activity code to actual activity
meanandstdtidy$activity[meanandstdtidy$activity == "1"] <- "walking"
meanandstdtidy$activity[meanandstdtidy$activity == "2"] <- "walking.upstairs"
meanandstdtidy$activity[meanandstdtidy$activity == "3"] <- "walking.downstairs"
meanandstdtidy$activity[meanandstdtidy$activity == "4"] <- "sitting"
meanandstdtidy$activity[meanandstdtidy$activity == "5"] <- "standing"
meanandstdtidy$activity[meanandstdtidy$activity == "6"] <- "laying"

## add "average of." to the names of columns 3-68
colnames(meanandstdtidy)[3:ncol(meanandstdtidy)] <- paste("average.of.", 
              colnames(meanandstdtidy)[3:ncol(meanandstdtidy)], sep = "")

## write the tidy data frame to file
write.table(meanandstdtidy, file = "./humanactivitybysmartphone.txt")
