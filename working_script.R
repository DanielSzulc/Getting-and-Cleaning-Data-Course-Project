setwd("~/Rprogramming/GC_project")
##download data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"./data/_samsung.zip")
unzip("./data/_samsung.zip",exdir="./data")

##reading and mergin train section
X_train <-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("./data/UCI HAR Dataset/train/y_train.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
train_subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

complete_train<-data.frame(y_train,train_subjects,X_train)
colnames(complete_train)<-c("ActivityCode","Subject",as.character(features[,2]))

##reading and mergin test section
X_test <-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")

test_subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

complete_test<-data.frame(y_test,test_subjects,X_test)
colnames(complete_test)<-c("ActivityCode","Subject",as.character(features[,2]))
require(dplyr)

##merging train and test section
merged_data <-rbind(complete_test,complete_train)

##selection of only variables with the mean and standard deviation (as described
## in point 2 of project requirements).
columns_with_mean_or_std <- c(grep("*mean*",colnames(merged_data)),grep("*std*",colnames(merged_data)))
#we want also to preserve first to columns with activity code and subject
selected_columns<-c(1,2,columns_with_mean_or_std)
