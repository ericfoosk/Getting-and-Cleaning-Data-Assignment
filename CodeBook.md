CodeBook
---------------------------------------------------------------
This code book describes the data, variables and transformations performed to clean up the data that leads to the preparation of `tidyDataset.txt` for later analysis.

Background
---------------------------------------------------------------
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article] (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).  Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The experiments have been video-recorded to label the data manually.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Dataset Used
---------------------------------------------------------------
This data is obtained from "Human Activity Recognition Using Smartphones Data Set".  The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone.  

A full description is available at the link below:
	<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data set used can be downloaded from the link below:
	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Input Data Set
---------------------------------------------------------------
The following obtained data files are used as input data:

- `X_train.txt`:- Training set.
- `y_train.txt`:- Training labels.
- `subject_train.txt`:- Each row identifies the subject who performed the activity for each window sample.  Its range is from 1 to 30.
- `X_test.txt`:- Test set.
- `y_test.txt`:- Test labels.
- `subject_test.txt`:- Each row identifies the subject who performed the activity for each window sample.  Its range is from 1 to 30.
- `activity_labels.txt`:- Links the class labels with their activity name.
- `features.txt`:- List of all features.

Transformations
---------------------------------------------------------------
The following transformations were performed on the input dataset:

- `X_train.txt` is read into `tempTrainX`.
- `y_train.txt` is read into `tempTrainY`.
- `subject_train.txt` is read into `tempSubjectTrain`.
- `X_test.txt` is read into `tempTestX`.
- `y_test.txt` is read into `tempTestY`.
- `subject_test.txt` is read into `tempSubjectTest`.
- `features.txt` is read into `featuresLabels`.
- `activity_labels.txt` is read into `activityLabels`.
- `tempTrainX` and `tempTestX` are merged to form `featuresDataset`.
- `tempTrainY` and `tempTestY` are merged to form `activityDataset`.
- `tempSubjectTrain` and `tempSubjectTest` are merged to form `subjectDataset`.
- `featureLabels` is used to set the names of the features in `featuresDataset`.
- `featuresDataset`, `activityDataset` and `subjectDataset` are merged to create `mergedDataset`.
- Indices of columns that contain std or mean, activity and subject are assigned into `extractedFeaturesLabels` .
- `extractedData` is created using data from columns in `extractedColumns`.
- `Activity` column in `extractedData` is updated with descriptive names of activities from `activityLabels`.  `Activity` column is then expressed as a factor variable.
- Acronyms in variable names in `extractedData`, like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive labels such as 'Accelerometer', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency'.
- `tidyDataset` is created as a set with average for each activity and subject of `extractedDataset`.  Entries in `tidyDataset` are ordered based on Subject and Activity.
- Finally, the data in `tidyDataset` is written into `tidyDataset.txt`.

Output Data Set
---------------------------------------------------------------
The output data `tidyDataset` is a tidy data set with the average of each variable for each activity and each subject. 