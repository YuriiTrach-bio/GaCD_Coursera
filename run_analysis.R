
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
                #Filter variables
                pattern <- grepl(pattern= "-mean\\()|-std\\()", names(X_test)) # TRUE FALSE vector for selecting columns;X_test and X_train has identical varibles names
                X_train <- X_train[,pattern]
                X_test <- X_test[,pattern]
        #y_test & y_traine
                #Decoding of variables
library(dplyr)
                y_test <- merge(y_test, activity_labels, by="V1", sort=FALSE) %>% 
                        select(V2)
                y_train <- merge(y_train, activity_labels, by="V1", sort=FALSE)%>% 
                        select(V2)
                #Rename variables
                names(y_test) <- "activity"
                names(y_train) <- "activity"
        #subject_test & subject_train
                #Rename varibles
                names(subject_train) <- "subject"
                names(subject_test) <- "subject"
## Data binding ====
        test_bind <- cbind(y_test, subject_test, X_test)
        train_bind <- cbind(y_train, subject_train, X_train)
                # Addin group column
                test_bind$group <- "test"
                train_bind$group <- "train"
        data <- rbind(test_bind, train_bind)
## Data tidying ====
library(tidyr)
        #creating new variables (just separating values of measure column)
        data <- tbl_df(data)
        data <- data %>%
                gather(key=measure, value = value, -c(activity, subject, group))%>% 
                separate(measure, c("measure","variable", "dimension"), sep="-", remove=FALSE)%>% 
                separate(measure, c("domaine_signals","measure"), sep=1, remove=FALSE)
        
        data$acceleration_type[grep("Body", data$measure)] <- "Body"
        data$acceleration_type[grep("Gravity", data$measure)] <- "gravity"
        
        data$sensor_signal[grep("Gyro", data$measure)] <- "gyroscope"
        data$sensor_signal[grep("Acc", data$measure)] <- "accelerometer"
        
        data$jerk_signal[grep("Jerk", data$measure)] <- TRUE
        data$jerk_signal[is.na(data$jerk_signal)] <- FALSE
        
        data$magnitude_signal[grep("Mag", data$measure)] <- TRUE
        data$magnitude_signal[is.na(data$magnitude_signal)] <- FALSE
        
        # decoding some variables
        data$domaine_signals[grep("t", data$domaine_signals)] <- "time"
        data$domaine_signals[grep("f", data$domaine_signals)] <- "frequency"
        
        data$variable[grep("mean()", data$variable)] <- "Mean"
        data$variable[grep("std()", data$variable)] <- "Standard deviation"
        
        #deleting unnecessary columns
        data <- data %>% select(-measure)
        
##Summarizing the data set ====
 data_summarized <- data %>% 
                group_by(activity, subject, variable) %>% 
                summarise(average=mean(value)); View(data_summarized)
                        