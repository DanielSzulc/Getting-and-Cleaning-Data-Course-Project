#
#  *** Run analysis script for Getting and Cleaning Data Project (coursera) ***

#  ******* input: raw data downloaded from:
#               https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#               Note: the script checks if data are downloaded to working directory
#               if not it downloads the data
#
#  ******* output: tidy data set as described in CodeBook.md document




##download data if there are no data in working directory
if (!file.exists("UCI HAR Dataset")) 
{       url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url,"samsung.zip")
        unzip("samsung.zip")
        unlink("samsung.zip",recursive=TRUE)
}

##reading and mergin train section
X_train <-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <-read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

complete_train<-data.frame(y_train,train_subjects,X_train)
colnames(complete_train)<-c("ActivityCode","Subject",as.character(features[,2]))

##reading and mergin test section
X_test <-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

complete_test<-data.frame(y_test,test_subjects,X_test)
colnames(complete_test)<-c("ActivityCode","Subject",as.character(features[,2]))

##merging train and test section
merged_data <-rbind(complete_test,complete_train)


##selection of only variables with the mean and standard deviation (as described
## in point 2 of project requirements).
columns_with_mean_or_std <- c(grep("*mean*",colnames(merged_data)),grep("*std*",colnames(merged_data)))

#we want also to preserve first to columns with activity code and subject
selected_columns<-c(1,2,columns_with_mean_or_std)
selected_merged_data<-merged_data[,selected_columns]


##Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels)<-c("id","activity_name")
selected_merged_data<-merge(selected_merged_data,activity_labels,
                            by.x="ActivityCode",by.y="id")


##From the data set in step 4, creates a second, independent tidy data set with the average of each variable
##for each activity and each subject.
tmp_melted<-melt(selected_merged_data,id=c("activity_name","Subject"),measure.vars=3:81)
tidy_data <- dcast(tmp_melted,activity_name+Subject~variable,mean)
rm(tmp_melted)
write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
