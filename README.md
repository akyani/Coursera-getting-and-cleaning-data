Getting and Cleaning Data: Course Project

Introduction

This repository contains my work for the course project for the Coursera course "Getting and Cleaning data".

Dataset

The features (561 of them) are unlabeled and can be found in the x_test.txt or y_train.txt. The activity labels are in theactivity_labels.txt file. The test subjects are in the subject_test.txt file.

The script called run_analysis.R which would answer to the requirments to this project. Prerequisites for this script:

the UCI HAR Dataset must be extracted and..
the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"
After merging testing and training, labels are added and and columns with mean and standard deviation are extracted.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
