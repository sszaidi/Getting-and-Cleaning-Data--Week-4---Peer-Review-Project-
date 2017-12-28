# Getting-and-Cleaning-Data--Week-4---Peer-Review-Project-4
Coursera Course: Data Science Specialization
Course: Getting and Cleaning Data 
Peer Reviewed Project: Week 4 Project 
This repo is being created to finish the assignment for week 4 (Getting and Cleaning Data). Following steps are involved: 
•	Download and unzip the data file into R working directory.
•	Download the R source code into your R working directory.
•	Execute R source code to generate tidy data file
•	Upload the readme and the R code along with the output data file in the repo created for this purpose.
Data 
Variables: X and Y 
Data X represents sensor signals measured with smartphone from 30 subjects whereas data Y gives activity-type, the subjects performed during the recording.
New dataset created 
The new generated dataset contains variables calculated based on the mean and standard deviation. Each row of the dataset gives an average of each activity type for all subjects involved in this exercise.
New Code Instructions: 
Read training and test dataset into R environment. Read variable names and subject index. 
a.	The training and the test sets are merged to create one data set. Rbind command was used for this purpose. 
b.	Information on the mean and standard deviation for each measurement was extracted. “grep” command was used to get column indexes for variable name containing "mean()" or "std()"
c.	Activity labels were converted to characters.
d.	Label the data set with descriptive variable names. 
e.	Lastly, an independent tidy data set with the average of each variable for each activity and each subject was created. 
