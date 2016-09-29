Getting and Cleaning Data: Course Project

Introduction

This repository contains the course project for the Coursera course "Getting and Cleaning data".

Dataset

The dataset contains data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available in the following website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphonesfeatures 

There are 561 variables for each training and test set can be found in the features.txt and uses to name the columns of x_test.txt and x_train.txt. The activity labels are in the activity_labels.txt file. The test subjects are in the subject_test.txt or subject_train.txt file.

The script called run_analysis.R which would answer to the requirments for this project. Prerequisites for this script:

the UCI HAR Dataset must be unzipped and availble in a directory called "UCI HAR Dataset"
After merging test and train data, labels are added and and columns with mean and standard deviation are extracted.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
