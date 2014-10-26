# Getting & Cleaning Data Course Project

## Purpose of the Project

The purpose of the project is to prepare tidy data from data collected from the accelerometers from the Samsung Galaxy S smartphone.
To perform this operation an R script called *__ run_analysis.R __* created. 
* The script uses as workdir the folder *__ courseproject3 __* which containts:
* The unziped data contents of the folder UCI HAR Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	* Data to be used for the analysis
	* README.txt describing the downloaded Data Set 
* The R Script *__ run_analysis.R __*
* This file README.md
* The codebook.md with the description of the *__ finalResult.txt __*
	* The *__ features_info.txt __* decribing the variables and the measures of each subject activity
* The Tidy Data Set txt file : *__ finalResult.txt __* 


# Detailed description of the steps nd actions in run_analysis.R to create the Tidy Data Set

1. Uses read.table to load Test & Train X & Y Data from the respective files into seperates R Data Frames (DF) :*__ myTestDf_X, myTestDf_Y,myTrainDf_X,myTrainDf_Y __*
2. Merges Test & Train  X data together into a new DF: *__ myDf_X __*
3. Merges Test & Train  Y data together into a new DF : *__ myDf_Y __*
4. Creates a new DF with the Y Data as first column and the X Data aftwerwords: *__ mydf __*
5. Uses read.table to load variables names and the position of the X Data of Test & Train Datasets into a new DF : *__ myVarNames __*
	* Names the columns of the DF 
	* Get the column numbers of only the measurements on the mean and standard deviation for each measurement into a vector : *__ myColNums __*
6. Creates a DF to be used for the tidy data using only the columns of the variables we kept on 5 : *__ myFinaldf __*
7. Uses read.table to load the activity names to be used for the Y Data into a new DF : *__ myActivities __*
	* Names the columns of the DF in order to be used to the next step
8. Creates the final DF *__ myNamedFinalDf __* by replaces the values of the Y column with the values of the *__ myActivities __*
	* Names the columns of the *__ myNamedFinalDf __* using the variables names in *__ myVarNames __*
9. Uses read.table to load the Subject Test & Train Data into a DFs :  *__ myTestSubjects & myTrainSubjects __*
	* Compines them to one DF : *__ mySubjects __*
10. Adds into the *__ myNamedFinalDf __* as first column the *__ mySubjects __* data
11. Using the *__ dplyr Package __* 
	* Converts *__ myNamedFinalDf __* to dplyr Data Set *__ myds __*
	* Group by each subject & activity and calulcate the mean for each variable into the *__ finalResult __* Tidy Data Set
12. Using *__ write.table __* create the Tidy Data Set text output result file *__ finalResult.txt __*
	

