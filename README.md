run_analysis.R info
===================

Some notes that describes how the script works follow:

The data needed are assumed to be resident in the R working directory.
The script needs the files:
- activity_labels.txt     this file contains descriptive activity
- features.txt            this file contains the measures column names
- subject_test.txt        test subject
- subject_train.txt       training subject
- X_test.txt              test observation
- X_train.txt             training observation
- y_test.txt              subject of test observations
- y_train.txt             subject of training observations

mainly the script:
- Read all needed dataset
- Adjust columns names
- add the columns relative to the activity and subject to the test and training dataset
- merge the test and training dataset
- Use the aggregate function to produce the tidy dataset
- The tidy colunms name are the same as the test and training columns name


