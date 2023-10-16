## Subject ID			subject_XXXXX.txt, row matches to data samples
## Activity ID			y_XXXXXX.txt, row matches to data samples, names in activity_labels.txt
## Data				x_XXXXXX.txt, row matches IDs above
## C://Users//fabrice.symonds//OneDrive - Demica Ltd//_Knowledge Base//Data Science with R//source//projects//cleaning-data-r-week4

setwd("C://Users//fabrice.symonds//OneDrive - Demica Ltd//_Knowledge Base//Data Science with R//source//projects//cleaning-data-r-week4")

test_subjects <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = " ")
test_activities <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = " ")
test_data <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = " ")
column_headers <- read.csv("./data/UCI HAR Dataset/features.txt", header = FALSE, sep = " ")
column_headers <- column_headers[,2]
##data2 <- read.csv("C://Users//fabrice.symonds//OneDrive - Demica Ltd//_Knowledge Base//Data Science with R//getdata_data_GDP.csv", colClasses = "character", skip = 4)

##ignore first two cols of data as empty 
test_data <- test_data %>% select(-c(V1, V2))
##OR
test_data <- test_data[,-1:-2]


## pivot_wider to transpose a df of the features.txt  to obtain colnames to copy inot test_data ?
library(tidyr)
column_headers = t(column_headers)
names(column_headers) <- column_headers[1,]
names(test_data) <- names(column_headers)


install.package("dplyr")
library(dplyr)
join(test_data, test_activities, by="KEY", type="inner")