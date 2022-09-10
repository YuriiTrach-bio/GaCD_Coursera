library(dplyr)

## Downloading the data ====
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url = url, destfile =paste(getwd(), "/data.zip", sep="")) # download the archive
unzip("data.zip") # extract a folder from the archive

## Reading data ====

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <-  read.table("UCI HAR Dataset/features.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Modifying the data ====
        #X_test & X_traine
                #Rename variables
                names(X_test) <- features[,2]
                names(X_train) <- features[,2]
        #y_test & y_traine
                #Rename variables
                names(y_test) <- "test_activ"
                names(y_train) <- "train_activ"
                #Decoding of variables
                
                
                
                
                
                