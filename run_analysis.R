>
>
>
>
> # Two different methods are availble to download the data from the source
> # First download it directly and unzip the files in the working directory
> # Set this this working directroy as the main directory for R to read data
> # Second method is to write the code to download the data from the source and unzip it. 
> # install few packages including "data.table", "reshape2", and "dplyr" 
>
>
># Download and Unzip the data set from the given source 
> 

> download.file(url = paste("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep = ""), destfile = "Dataset.zip", mode = 'wb',cacheOK = FALSE)
> if (!file.exists("UCI HAR Dataset")) {unzip(Dataset)}
> activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
> # Make sure that activityLabels are correct
> activityLables
> # Covert the labels into characters 
> activityLabels[,2] <- as.character(activityLabels[,2])
> # Make sure it happened
> activityLabels[,2] 
> # Laoding features and coverting them into characters
> features <- read.table("UCI HAR Dataset/features.txt")
> features[,2] <- as.character(features[,2])
> # make sure it happened
> features[ ,2]
> # Mean and SD on each measurement 
> features_required <- grep(".^mean.^|.^std.^", features[,2])
> features_required.names <- features[features_required,2]
> features_required.names = gsub('-mean', 'Mean', features_required.names)
> features_required.names = gsub('-std', 'Std', features_required.names)
> features_required.names <- gsub('[-()]', '', features_required.names)
> # Make sure it worked
> features_required.names
>
># Laoding training dataset 
> train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_required]
> trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
> trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
> trainActivities
> trainSubjects
> % mergning data 
> train <- cbind(trainSubjects, trainActivities, train)
> train
>
>
> % Loading testing data 
> test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_required]
> testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
> testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
># Merging
> test<- cbind(testSubjects, testActivities, test)
># combining data - test and train 
> CombinedData <- rbind(train, test)
> colnames(CombinedData) <- c("subject", "activity", featuresWanted.names)
>
> CombinedData$activity <- factor(CombinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])

> CombinedData$subject <- as.factor(CombinedData$subject)
> 
>
> library(reshape2)
>
> CombinedData.melted <- melt(CombinedData, id = c("subject", "activity"))
>
> CombinedData.mean <- dcast(CombinedData.melted, subject + activity ~ variable, mean)
>
> # uploading new completed data set
> write.table(CombinedData.mean, file = "TidyDataSet.txt", row.names = FALSE, quote = FALSE)
>
>




> 