#################################################################################################
#Author: Wellintton Perez 2018
#
#This is function reads the data for the training data set and extract the mean and std variables
#
#Function: prepareTest(directory, rows)
# directory: The data directory where the UCI data set is loaded
# rows: the number of rows to process this is only used for debugging and testing.
# Returns: this function returns a data.table
prepareTraining<-function(directory,rows=-1){
  data<-read.table(file.path(directory,"X_train.txt",sep=""),nrows=rows, header=FALSE,stringsAsFactors = FALSE,colClasses = NA)
  
  subject<-read.table(file.path(directory,"subject_train.txt",sep = ""),nrows=rows, header=FALSE,stringsAsFactors = FALSE,colClasses = NA)
  
  activity<-read.table(file.path(directory,"Y_train.txt",sep = ""),nrows=rows, header=FALSE,stringsAsFactors = FALSE,colClasses = NA)
  
  activity<-activities_labels[activity$V1,]
  
  colnames(data)<-features$V2
  
  data<-data[,grep("std|mean",tolower(colnames(data)))]
  
  data<-cbind(activity$V2,data)
  data<-cbind(subject,data)
  
  colnames(data)[1]<-"subject"
  colnames(data)[2]<-"activity"
  
  data<-data.table(data)
  
  return(data)  
}
