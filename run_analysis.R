library(dplyr)

## Downloading the data ====
#  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#  download.file(url = url, destfile =paste(getwd(), "/data.zip", sep="")) # download the archive
#  unzip("data.zip") # extract a folder from the archive

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
                #Decoding of variables
                y_test <- merge(y_test, activity_labels, by="V1", sort=FALSE) %>% 
                        select(V2)
                y_train <- merge(y_train, activity_labels, by="V1", sort=FALSE)%>% 
                        select(V2)
                #Rename variables
                names(y_test) <- "test_activ"
                names(y_train) <- "train_activ"
        #subject_test & subject_train
                #Rename varibles
                names(subject_train) <- "subject"
                names(subject_test) <- "subject"
## Data binding ====
        test_bind <- cbind(y_test, subject_test, X_test)
        train_bind <- cbind(y_train, subject_train, X_train)
                # Addin group column
                test_bind$Group <- "test"
                train_bind$Group <- "train"
                
                