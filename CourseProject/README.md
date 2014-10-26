# Getting & Cleaning Data Course Project

## Purpose of the Project

The purpose of the project is to prepare a tidy data set from data collected from the accelerometers from the Samsung Galaxy S smartphone. Data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unziped into directory **CourseProject**

## **CourseProject** directory contents:

* The folders **test** & **train** with the data of the analysis and the subject data used
* **README.txt** describing the downloaded Data Set
* The **activity_lables.txt** decsribing the activities performed
* The **features.txt** and the **features_info.txt** decribing the variables and the measures of each subject activity
* The R Script created to perfomr the analysis **run_analysis.R**
* This file **README.md**
* The **codebook.md** with the description of the **finalResult.txt**
* The Tidy Data Set txt file **finalResult.txt**

R script **run_analysis.R** performs the follwoing to create the Tidy Data Set

1. Uses **read.table** to load Test & Train X & Y Data from the respective files into seperates R Data Frames (DF) : **myTestDf_X, myTestDf_Y,myTrainDf_X,myTrainDf_Y**
2. Merges Test & Train  X data together into a new DF: **myDf_X**
3. Merges Test & Train  Y data together into a new DF : **myDf_Y**
4. Creates a new DF with the Y Data as first column and the X Data as the next columns: **mydf**
5. Uses read.table to load variables names and the position of the X Data of Test & Train Datasets into a new DF : **myVarNames**
	* Names the columns of the DF 
	* Get the column numbers of only the measurements on the mean and standard deviation for each measurement into a vector : **myColNums**
6. Creates a DF to be used for the tidy data using only the columns of the variables we kept on 5 : **myFinaldf**
7. Uses read.table to load the activity names to be used for the Y Data into a new DF : **myActivities**
	* Names the columns of the DF in order to be used to the next step
8. Creates the final DF **myNamedFinalDf** by replaces the values of the Y column with the values of the **myActivities**
	* Names the columns of the **myNamedFinalDf** using the variables names in  **myVarNames**
9. Uses **read.table** to load the Subject Test & Train Data into a DFs : **myTestSubjects & myTrainSubjects**
	* Compines them to one DF : **mySubjects**
10. Adds into the **myNamedFinalDf** as first column the **mySubjects** data
11. Using the **dplyr Package**
	* Converts **myNamedFinalDf** to dplyr Data Set **myds**
	* Group by each subject & activity and calulcate the mean for each variable into the **finalResult** Tidy Data Set
12. Using **write.table** create the Tidy Data Set text output result file **finalResult.txt**
	

