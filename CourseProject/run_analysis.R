# Use dplyr Data to create the final clean data set
install.packages("dplyr")
library(dplyr)

# Load X & Y Test Data into DFs
myTestDf_X<-read.table("test/X_test.txt",sep="", header=FALSE)
myTestDf_Y<-read.table("test/Y_test.txt",sep="", header=FALSE)

# Load X & Y Train Data into DFs
myTrainDf_X<-read.table("train/X_train.txt",sep="", header=FALSE)
myTrainDf_Y<-read.table("train/Y_train.txt",sep="", header=FALSE)

# Merge X data
myDf_X<-rbind(myTestDf_X,myTrainDf_X)
# Merge Y Data
myDf_Y<-rbind(myTestDf_Y,myTrainDf_Y)

# Merge Data Together to one Data Frame, using Y Data as the first column
mydf<-cbind(myDf_Y,myDf_X)

# Load Variable Names and columns position info
myVarNames<-read.table("features.txt",sep="", header=FALSE)

# Set the names of the columns
colnames(myVarNames) <-c("pos","VarName")

# Get the column number of only the measurements on the mean and standard deviation for each measurement
myColNums<-sort(c(myVarNames[grep("mean()",myVarNames$VarName,fixed=TRUE),1], myVarNames[grep("std()",myVarNames$VarName,fixed=TRUE),1]))

# Create the data frame with only the measurements on the mean and standard deviation for each measurement
myFinaldf<-mydf[,c(1,myColNums+1)]

# Load Activities Names
myActivities<-read.table("activity_labels.txt",sep="", header=FALSE)
colnames(myActivities) <-c("val","name")

# Creates the final DF by naming the activity for Y Data value (Column V1) based on decritpion of myActivities DF
myNamedFinalDf<-within(myFinaldf,V1<-myActivities$name[V1])

# Set the column names using the variable names
colnames(myNamedFinalDf)<-c("Activity",as.character(myVarNames$VarName[myColNums]))

# Load Subject Test Data
myTestSubjects <-read.table("test/subject_test.txt",sep="", header=FALSE)

# Load Subject Train Data
myTrainSubjects <- read.table("train/subject_train.txt",sep="", header=FALSE)

# Combine Subjects
mySubjects<-rbind(myTestSubjects,myTrainSubjects)
colnames(mySubjects)<-c("Subject")

# Add Subject Data in the Data Set
myNamedFinalDf<-cbind(mySubjects,myNamedFinalDf)

# Convert Df to dplyr Data Set 
myds<-tbl_df(myNamedFinalDf)

# Create a Tidy Data Set : Group by each subject & activity and calulcate the mean for each variable
finalResult <- 
	myds %>%
	group_by(Subject,Activity) %>%
	summarise_each(funs(mean))

# Create a text output result file for the Tidy data set
write.table(finalResult,file="finalResult.txt",row.name=FALSE)


