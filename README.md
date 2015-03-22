Getting and Cleaning Data Course Assignment
---------------------------------------------------------------

Background
---------------------------------------------------------------
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article] (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).  Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The experiments have been video-recorded to label the data manually.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Dataset Used
---------------------------------------------------------------
This data is obtained from "Human Activity Recognition Using Smartphones Data Set".  The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the link below:
	<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data set used can be downloaded from the link below:
	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Purpose and Goal
---------------------------------------------------------------
The purpose of this project is to collect, work with, and clean a data set.  

The goal is to prepare tidy data that can be used for later analysis. 

R script called run_analysis.R is created to do the following:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository, you find:
- *README.md*:-  How the scripts work
- *CodeBook.md*:-  Describes the variables, data and transformations that were performed to clean up the data
- *run_analysis.R*:-  The R script that used to run on the data set
- *tidyDataset.txt*:-  Clean data extracted from the original data using *run_analysis.R*

Please take note that the *run_analysis.R* is written using R Studio version 3.1.2 in Windows 8 environment, hence the syntax used maybe different for operating systems like Linux or Mac.

How to run the script:
---------------------------------------------------------------
1.  Download the data from: 
	<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
2.  Extract the archive into the working directory for R; sub-folder "UCI HAR Dataset" will be created.
3.  Run the script *run_analysis.R* using RStudio.
4.  An output file *tidyDataset.txt* will be generated in the same directory where *run_analysis.R* is located.