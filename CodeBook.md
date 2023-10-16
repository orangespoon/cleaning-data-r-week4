Please note the transformations required to obtain a tidy dataset are detailed in the last section of this document.


TITLE:			
--------------------------------------------------------------------------------------------------------------------
Human Activity Recognition Using Smartphones


DESCRIPTION:
--------------------------------------------------------------------------------------------------------------------
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


SOURCE:
--------------------------------------------------------------------------------------------------------------------
Raw data original description:	http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones
Raw data location:				https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


DATASET:
--------------------------------------------------------------------------------------------------------------------
Dataset Characteristics:	Multivariate, Time-Series
Subject Area:				Computer Science
Associated Tasks:			Classifivcation, Clustering
Has Missing Values?:		No

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: http://www.youtube.com/watch?v=XOEN9W05_4A

An updated version of this dataset can be found at http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows. 


VARIABLES:
--------------------------------------------------------------------------------------------------------------------
For each record in the dataset the following are provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING] 
- An identifier of the subject who carried out the experiment. 


TRANSFORMATIONS:
--------------------------------------------------------------------------------------------------------------------
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
The following steps were taken to obtain the final tidy dataset required under Data_Cleaning/Week_4/Course_Project assignment:


1. load packages and set working dir
2. load subjects, activities(y) and data(x) for both TESTing and TRAINing
3. load activity LABELS and FEATURES
4. set the ID col names to be decriptive and apply the features names 
4. merge the training and testing data and then merge both into one data set
5. merge in the activity names
6. select out the grou key (subject and activity) with mean and std dev columns (all that match)
7. aggreate to obtain the mean of each column by grpoup key (subject + activity)
8. save the final tidy data set to file
