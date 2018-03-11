#!/usr/bin/env Rscript

#######################################################################################
#Author: Wellintton Perez 2018

#this script creates two tidy datasets from the UCI Human Activity Recognition dataset
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Scripts steps
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

rows=-1 #use this variable to work with the subset of the data for testing and debugging

args = commandArgs(trailingOnly=TRUE)

if(length(args)==0){
  stop("Please enter your script home directoty")
}else{
  home_dir=file.path(args[2])
}

#home_dir='F:/home/coursera/projects/assignment4/'  

message("Initializing libraries")
library(plyr)
library(data.table)

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
uci_root<-"UCI HAR Dataset"

data<-file.path(home_dir,"data") # creates a repository to keep the raw data

#if the directory data does not existing down fresh data

if(!file.exists(data)){
  message("downloading data set from the UCI website.")
  rawdata<-tempfile()
  download.file(url,rawdata) #download data from the URL
  unzip(rawdata,exdir=data)
}else{
  message("data directory found.")
}

message("Loading the activity labels files")
activities_labels<-read.table(file.path(data,uci_root,"activity_labels.txt"),header=FALSE,stringsAsFactors = FALSE,colClasses = NA)

message("Loading the features files")
features<-read.table(file.path(data,uci_root,"features.txt"),header=FALSE,stringsAsFactors = FALSE,colClasses = NA)

source(file.path(home_dir,"training.R"))
source(file.path(home_dir,"test.R"))

message("Processing the test data set.")
test<-prepareTest(file.path(data,uci_root,"test"),rows)
message(sprintf("Records processed: %d\n",nrow(test)))

message("Processing the training data set.")
training<-prepareTraining(file.path(data,uci_root,"train"),rows)
message(sprintf("Records processed: %d\n",nrow(training)))

message("Merging the training and test data set")
dataset<-rbind(training,test) # combine the datasets
message(sprintf("Records processed: %d\n",nrow(dataset)))


message("Making the variable.")
names<-gsub("\\()","",colnames(dataset)) #replace () with blank
names<-gsub("\\(","-",names) #replace '(' with -
names<-gsub(")","",names) #replace '(' with -
names<-gsub(",","-",names) #replace ',' with '-'
colnames(dataset)<-names # assign new names to dataset

dataset<-arrange(dataset,subject)

message("sumarizes the data by subject and activity")
dataset2<-dataset[,lapply(.SD,mean),by=list(subject,activity)]

dataset2<-arrange(dataset2,subject)

uci_tidy<-file.path(data,"UCI-Tidy.csv")
uci_tidy2<-file.path(data,"UCI-Tidy-summarize.csv")

message(sprintf("Saving the new tidy data sets: \n%s\n%s",uci_tidy,uci_tidy2))
write.table(dataset,uci_tidy,row.names = FALSE)
write.table(dataset2,uci_tidy2,row.names = FALSE)

message("\nCompleted!\n")
