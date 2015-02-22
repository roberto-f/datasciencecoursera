# Reading test dataset
x_test <- read.table("X_test.txt")
# Reading training dataset
x_train <- read.table("X_train.txt")
# Reading test subject dataset
x_subjtest <- read.table("subject_test.txt")
# reading training subject dataset
x_subjtrain <- read.table("subject_train.txt")
# Read test activity
a_test <- read.table("y_test.txt")
# Read training activity
a_train <- read.table("y_train.txt")
# Set "activity" as column name for test activities and "subject" for test subject
names(a_test)[1] <- "activity"
names(x_subjtest)[1] <- "subject"
# Set "activity" as column name for training activities and "subject" for training subject
names(a_train)[1] <- "activity"
names(x_subjtrain)[1] <- "subject"
# Build test and training dataframe with activity and subject column
t_test <- cbind(x_subjtest, a_test, x_test)
t_train <- cbind(x_subjtrain, a_train, x_train)
# Merge test and training dataset
t_all <- rbind(t_train, t_test)
# Read columns name
f_text <- read.table("features.txt")
# remove special chrs from column names
names(t_all)[3:length(t_all)] <- str_replace_all(as.character(f_text[,2]), "[[:punct:]]", "")
library(digest)
# remove duplicate columns and select only means and std columns
t_unique <- t_all[!duplicated(lapply(t_all, digest))]
t_unique <- select(t_unique, subject, activity, contains("mean"), contains("std"))
# Uses descriptive activity names to name the activities in the data set
a_labels <- read.table("activity_labels.txt")
t_unique$activity <- a_labels[t_unique$activity,2]
# Produce t_tidy dataframe and wite it to disk
t_tidy <- aggregate(t_unique[names(t_unique)[3:length(t_unique)]],by=t_unique[c("activity","subject")],FUN=mean)
write.table(t_tidy, "t_tidy.txt", row.name=FALSE)
