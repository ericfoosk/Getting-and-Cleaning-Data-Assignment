# Load required libraries
library(stringi)
library(data.table)

# Requirement 1:- Merges the training and the test sets to create one data set

# Step 1: Read in the data files
# Read Fearures files
tempTrainX <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
tempTestX <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)

# Read the Activity files
tempTrainY <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
tempTestY <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE)

# Read the Subject files
tempSubjectTrain <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
tempSubjectTest <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)

# Step 2: Bind the data tables by rows
# Bind the features data tables by rows
featuresDataset <- rbind(tempTrainX, tempTestX)

# Bind the activity data tables by rows
activityDataset <- rbind(tempTrainY, tempTestY)

# Bind the subject data tables by rows
subjectDataset <- rbind(tempSubjectTrain, tempSubjectTest)

# Step 3: Set column names in the data sets
colnames(subjectDataset) <- "Subject"
colnames(activityDataset) <- "Activity"

featuresLabels <- read.table(".\\UCI HAR Dataset\\features.txt")
colnames(featuresDataset) <- t(featuresLabels[2])

# Step 4: Merge the columns and assign it to mergeDataset
mergedDataset <- cbind(featuresDataset, activityDataset, subjectDataset)


# ==============================================================================================================


# Requirement 2:- Extracts only the measurements on the mean and standard deviation for each measurement

# Step 1: Filter names of the features by measurements on Mean and Standard Deviation
extractedFeaturesLabels <- grep(".*Mean.*|.*Std.*", names(mergedDataset), ignore.case = TRUE)

# Step 2: Store the selected names into extractLabels
extractedColumns <- c(extractedFeaturesLabels, 562, 563)

# Step 3: Subset mergeDataset using extractLabels and assign to extractData
extractedDataSet <- mergedDataset[, extractedColumns]


# ==============================================================================================================


# Requirement 3:- Uses descriptive activity names to name the activities in the data set

# Step 1: Read in the activity label data file
activityLabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", header = FALSE)

# Step 2: Replace underscore with whitespace
activityLabels[, 2] = gsub("_", " ", tolower(as.character(activityLabels[, 2])))

# Step 3: Replace the coded number with matching descriptive activity names
extractedDataSet$Activity <- activityLabels[extractedDataSet$Activity, 2]
extractedDataSet$Activity <- stri_trans_totitle(extractedDataSet$Activity)
extractedDataSet$Activity <- as.factor(extractedDataSet$Activity)


# ==============================================================================================================


# Requirement 4:- Appropriately labels the data set with descriptive variable names. 

# Step 1: Replace t in the beginining of the label name as Time
names(extractedDataSet) <- gsub("^t", "Time", names(extractedDataSet))

# Step 2: Replace f in the beginining of the label name as Frequency
names(extractedDataSet) <- gsub("^f", "Frequency", names(extractedDataSet))

# Step 3: Replace exact word Acc in the label name as Accelerometer
names(extractedDataSet) <- gsub("Acc", "Accelerometer", names(extractedDataSet))

# Step 4: Replace exact word angle in the label name as Angle
names(extractedDataSet)<-gsub("angle", "Angle", names(extractedDataSet))

# Step 5: Replace exact word BodyBody in the label name as Body
names(extractedDataSet) <- gsub("BodyBody", "Body", names(extractedDataSet))

# Step 6: Replace exact word gravity in the label name as Gravity
names(extractedDataSet)<-gsub("gravity", "Gravity", names(extractedDataSet))

# Step 7 Replace exact word Gyro in the label name as Gyroscope
names(extractedDataSet) <- gsub("Gyro", "Gyroscope", names(extractedDataSet))

# Step 8: Replace exact word Mag in the label name as Magnitude
names(extractedDataSet) <- gsub("Mag", "Magnitude", names(extractedDataSet))

# Step 9: Replace exact word tBody in the label name as TimeBody
names(extractedDataSet) <- gsub("tBody", "TimeBody", names(extractedDataSet))

# Step 10: Replace exact word -mean() in the label name as -Mean()
names(extractedDataSet) <- gsub("-mean()", "-Mean()", names(extractedDataSet), ignore.case = TRUE)

# Step 11: Replace exact word -std() in the label name as -STD()
names(extractedDataSet) <- gsub("-std()", "-STD()", names(extractedDataSet), ignore.case = TRUE)


# ==============================================================================================================


# Requirement 5:- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

extractedDataSet$Subject <- as.factor(extractedDataSet$Subject)
extractedDataSet <- data.table(extractedDataSet)
tidyDataset <- aggregate(. ~Subject + Activity, data = extractedDataSet, FUN = "mean")
tidyDataset <- tidyDataset[order(tidyDataset$Subject, tidyDataset$Activity), ]
write.table(tidyDataset, file = "tidyDataset.txt", row.name = FALSE)