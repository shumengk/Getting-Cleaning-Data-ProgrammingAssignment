# Getting and Cleaning Data Course Project CodeBook

### Experiment Data Description
The experiments were carried out with a group of 30 subjects. Each person performed six activities wearing Samsung Galaxy S II on their waist.
Data was collected from the embedded accelerometer.

### Workflow
`run_analysis.R` reads the experiment data and performs the following to tidy and summarize the dataset.
* Training and test datasets are read and combined.
* The columns of the combined dataset are named from the `features.txt`.
* The columns corresponding to mean or standard deviation of measurements are extracted.
* The activity labels are replaced with descriptive identifiers from the `activity_labels.txt`.
* From the properly labeled, tidy, combined dataset, the average of each variable for each activity and each subject is computed.
* Resulted summary is outputed as `run_analysis_summary.txt`.


### More Information
Detailed information on the experiment data is available in `README.txt` and `features_info.txt` in the [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
A full description may be found on the dataset [homepage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
