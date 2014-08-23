G-C-Data-Project
================

## Introduction

The run_analysis script makes use of the Human Activity Recognition using Smartphones dataset from the UCI Machine Learning Repository. For this study 30 subjects were observed doing 6 activities and a total of 561 variables were recorded using the phone.

The subjects were divided into two groups: test and train group. The test group consisted of 30% of the total subjects and a total of 2947 observations. The train group consisted of 70% of the subjects and a total of 7352 observations.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


###PART 1:
The first part of the program reads in the test and train datasets into R and properly named and analysed. I have also read in the features dataset and replaced the 561 column names with those in the features dataset. The varible names were cleaned by removing "-" and "," but I retained the "()" as they would be needed in PART 2.

The subject, activity and observation dataframes were combined using cbind for both the groups and finally rbind combined the test and train groups into one big dataframe named "TTdf".

###PART 2:
Here the grep command subset the "TTdf" dataframe for mean and standard deviations measurements of the observations.

###PART 3:
To subsitute the activity with their corresponding names, I used factors and the first step was to subset the different activities which will be used as labels and then turning the activity column in the "TTdf" dataframe as a factor and passing the labels.

###PART 4:
As "-", and "," were already removed in earlier steps, I removed the "()" here as they are not R friendly and replaced them in the "TTdf" dataframe.


###PART 5:
A new tidy dataframe was created using the aggregate command consiting of the means of each observation. The "by" parameter takes in a list which is used to classify the rest of the dataframe. In this case there were two variables by which to classify the data: "Subject" and "activity". As there are 30 subjects and 6 activities, the new dataset will have 180 rows and the number of rows will remain unchanged.
