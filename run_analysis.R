
getwd()
setwd("C:/Users/Joann/UCI_Dataset")

#PART 1 Merges the training and the test sets to create one data set.

#Creating subject identifier dataframe and changing the column name
test_sub<-read.table("./test/subject_test.txt",header=FALSE)
head(test_sub)
tail(test_sub)
dim(test_sub)
colnames(test_sub)<-"Subject"

train_sub<-read.table("./train/subject_train.txt",header=FALSE)
head(train_sub)
dim(train_sub)
colnames(train_sub)<-"Subject"


#Creating activity dataframe and changing the column name
test_y<-read.table("./test/y_test.txt",header=FALSE)
head(test_y)
dim(test_y)
names(test_y)<-"Activity"

train_y<-read.table("./train/y_train.txt",header=FALSE)
head(train_y)
dim(train_y)
colnames(train_y)<-"Activity"


# Creating the features dataframe which contains the names of the columns.
# This step is also pasted in Part 4 as it will be easier for the grader to 
# evaluate PART 4
features<-read.table("./features.txt",header=FALSE)
features
head(features)
dim(features)

#cleaning names by removing "-"
fea<-gsub("-|,", "", features[,2])

#Creating observation dataframe and changing the column names
test_X<-read.table("./test/x_test.txt",header=FALSE)
head(test_X)
dim(test_X)
colnames(test_X)<-fea     

train_X<-read.table("./train/x_train.txt",header=FALSE)
head(train_X)
dim(train_X)
colnames(train_X)<-fea


#Creating test and train dataframes
Test<-cbind(test_sub,test_y,test_X)
Test[1:3,1:4]
dim(Test)

Train<-cbind(train_sub, train_y,train_X)
Train[1:3,1:4]
dim(Train)

#Combining the test and train dataframes
TTdf<-rbind(Test,Train)
dim(TTdf)



#PART 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

#subsetting values which contain mean() or std()
MeanStd<-grep("mean()|std()", names(TTdf), value=TRUE)
MeanStd
length(MeanStd)
TTdf_MeanStd<-TTdf[,MeanStd]
dim(TTdf_MeanStd)


#PART 3:Uses descriptive activity names to name the activities in the data set.

activity<-read.table("./activity_labels.txt",header=FALSE)
head(activity)

act<-activity$V2
TTdf$Activity<-factor(TTdf$Activity, labels=act)
TTdf[1:3,1:6]

# PART 4 :Appropriately labels the data set with descriptive variable names
#The below code is pasted here again for evaluation purposes. 

features<-read.table("./features.txt",header=FALSE)
features
head(features)
dim(features)

#cleaning names by removing () braces.

fea1<-gsub("\\()", "", fea) 
fea1<-c("Subject", "Activity", fea1)
colnames(TTdf)<-fea1
fea1
colnames(TTdf)

# PART 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
sum(is.na(TTdf)) #checking for n/a values
Tidy_TTdf<-aggregate(TTdf[3:563],by=list(Subject=TTdf$Subject, Activity=TTdf$Activity), FUN=mean )
Tidy_TTdf[1:5,1:5]
dim(Tidy_TTdf)

#writing the new tidt dataset to a text file
write.table(Tidy_TTdf, "./tidyData.txt", sep=",", row.names=FALSE)
