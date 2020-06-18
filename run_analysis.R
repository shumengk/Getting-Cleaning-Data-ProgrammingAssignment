library(dplyr)

# Load feature and activity label data
feature <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

# Extract the column numbers (colNum) and names (colName) of the mean 
# and standard deviation of each measurement
colNum <- feature$V1[grep("mean\\(\\)|std\\(\\)", feature$V2, fixed=FALSE)]
colName <- as.character(feature[colNum,"V2"])

# Load training data
subject_train <- read.table("train/subject_train.txt")
train_y <- read.table("train/y_train.txt")
train_x <- read.table("train/X_train.txt")

# Combine training data: subject information, activity labels, and measurements
# on the mean and standard deviation of each measurement
train <- data.frame(subject_train, train_y, train_x[,colNum])

rm(subject_train, train_y, train_x)

# Load testing data
subject_test <- read.table("test/subject_test.txt")
test_y <- read.table("test/y_test.txt")
test_x <- read.table("test/x_test.txt")

# Combine testing data: subject information, activity labels, and measurements
# on the mean and standard deviation of each measurement
test <- data.frame(subject_test, test_y, test_x[,colNum])

rm(subject_test, test_y, test_x)

# Combine training and test sets
total <- rbind(train, test)

# Name the columns with Descriptive labels
colnames(total) <- c("Subject_ID", "Activity_Label", colName)

# Replace the activity labels with descriptive names
total$Activity_Label <- activity[match(total$Activity_Label,activity$V1),"V2"]

# Compute
dat.summary <- total %>% group_by(Subject_ID, Activity_Label) %>%
  summarise_all(mean)

write.table(dat.summary, file = "run_analysis_summary.txt", row.names = FALSE)
