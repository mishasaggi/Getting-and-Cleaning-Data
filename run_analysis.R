library(data.table)
# Step1. Merges the training and the test sets to create one data set.
dataTrain <- read.table("./uci/train/X_train.txt")
labelTrain <- read.table("./uci/train/y_train.txt")
subjectTrain <- read.table("./uci/train/subject_train.txt")
dataTest <- read.table("./uci/test/X_test.txt")
labelTest <- read.table("./uci/test/y_test.txt")
subjectTest <- read.table("./uci/test/subject_test.txt")
joinData <- rbind(dataTrain, dataTest)
joinLabel <- rbind(labelTrain, labelTest)
joinSubject <- rbind(subjectTrain, subjectTest)

# Step2. Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
features <- read.table("./uci/features.txt")
meanStdCol <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinData <- joinData[, meanStdCol]
names(joinData) <- gsub("\\(\\)", "", features[meanStdCol, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in col names 
names(joinData) <- gsub('^t', "time", names(joinData)) # expand prefix
names(joinData) <- gsub('^f', "freq", names(joinData)) # expand prefix
names(joinData) <- gsub('Acc', 'Acceleration', names(joinData)) # expand
names(joinData) <- gsub('Mag', 'Magnitude', names(joinData)) # expand

# Step3. Uses descriptive activity names to 
# name the activities in the data set
activity <- read.table("./uci/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
labelActivity <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- labelActivity
names(joinLabel) <- "activity"

# Step4. Appropriately labels the data set with 
# descriptive activity names. 
names(joinSubject) <- "subject"
dataClean <- cbind(joinSubject, joinLabel, joinData)
# 1st tidy dataset
write.table(dataClean, "merged_data.txt") 

# Step5. Creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 

tidydf <- read.table('merged_data.txt')
dataCleanAv <- data.table(tidydf)

keys <- c('subject', 'activity')
setkeyv(dataCleanAv, keys)

# Summarize data basd on subject and activity
dataCleanAv <- dataCleanAv[, lapply(.SD, mean), by=key(dataCleanAv)]

# 2nd tidy dataset
write.table(dataCleanAv, file='merged_data_summarized.txt')

