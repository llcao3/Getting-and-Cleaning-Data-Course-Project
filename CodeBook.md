### Objective
 - Coursera final project: https://www.coursera.org/learn/data-cleaning/

### Data Sources
 - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
### Steps taken in `run_analysis.R`
 - Download and unzip **UCI HAR Dataset**
 - Load feature names using 'read.table()' and assign them to featurenames
 - Load training dataset, training subjects, and training activities using `read.table()`
 - Load testing dataset, testing subjects, and testing activities using `read.table()`
 - Create a `DT_test` data frame by `cbind` training dataset, subjects, and activities
 - Create a `DT_train` data frame by `cbind` testing dataset, subjects, and activities
 - Merge `DT_test` and `tDT_train` by `rbind`
 - Extract the required columns by regular expression (`grep`)
 - Finally, piping the `DT4` data frame through `group_by` and `summarize_all` from the **dplyr** library

### Variables
 - `DT_train`: All training observations
 - `DT_test`: All testing observations
 - `DT1`: The combination of `training` and `testing`
 - `featurenames`: A vector of feature names derived from the 2nd column of "UCI HAR Dataset/features.txt"
 - `DT2`: A subset of `DT1` with mean and standard deviation for each measurement only.
 - `DT3`: Label the `DT2` with activity labels.
 - `DT4`: Reorder the columns of `DT3`.
 - `DT5`: The average of each column of `DT4` for each activity and each subject.

### Data Cleaning
 - Extract mean and standard deviation for each measurement only.