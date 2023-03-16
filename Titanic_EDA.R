# ==============GSLC================
# Alyza Rahima Pramudya - 2502032125
# ==================================

#=================2A================

data("titanic_train") # load titanic_train dataset
titanic <- titanic_train # copy titanic_train into titanic
dim(titanic) # show number of rows and columns (row, column)
colnames(titanic) # show all columns name
head(titanic) # show the first six rows
tail(titanic) # show the last six rows
str(titanic) # show the structure of the dataset (number of rows and columns, datatypes, example data)
view(titanic) # open a new window to show us all the data from titanic dataset

table(titanic$Survived) # counts the number of each unique value in “Survived"
table(titanic$Pclass) # counts the number of each unique value in “Pclass"
table(titanic$Sex) # counts the number of each unique value in “Sex"
table(titanic$SibSp) # counts the number of each unique value in “SibSp"
table(titanic$Parch) # counts the number of each unique value in "Parch
table(titanic$Embarked) # counts the number of each unique value in “Embarked"

summary(titanic) # show us the summary of titanic dataset
titanic$Survived = as.factor(titanic$Survived) # change variable Survived into factor
titanic$Sex <- as.factor(titanic$Sex) # change variable Sex into factor
titanic$Embarked <- as.factor(titanic$Embarked) # change variable Embarked into factor
summary(titanic) # show us the summary of titanic dataset

#=================2B=================

# Searching for null values in every column
colSums(is.na(titanic))

# create a new dataset new_titanic by excluding all rows that contain missing values in titanic 
new_titanic = titanic[rowSums(is.na(titanic)) <=0, ]

# Searching for null values in every column
colSums(is.na(new_titanic))
 
# insert the duplicate rows from titanic dataset
duplicated_rows <- duplicated(new_titanic)
# sum all the duplicated rows
sum(duplicated_rows)

library(ggplot2) 
# looking for outliers in Age and Fare variables
var_num <- c("Age", "Fare") 

par(mfrow = c(1,2))
for (i in 1:length(var_num)) {
  boxplot(new_titanic[, var_num[i]], main = paste("Boxplot of", var_num[i]))
}

# print all the outliers in Age and Fare variables
for (i in 1:length(var_num)) {
  outliers <- boxplot.stats(new_titanic[, var_num[i]], coef=1.5)$out
  print(paste("Outliers in", var_num[i], "variable:", paste(outliers, collapse=", ")))
}

#=================2C=================

# Plot 1
counts <- table(new_titanic$Survived)

ggplot(data = data.frame(Class = names(counts), Count = as.vector(counts)), aes(x = Class, y = Count)) +
  geom_bar(stat = "identity", fill = "slateblue") +
  labs(x = "Class", y = "Count", title = "Number of survivor vs non-survivor")


# Plot 2
columns <- c('Sex', 'Pclass', 'Age', 'SibSp', 'Parch', 'Embarked')

for(i in columns){
  freq_table <- prop.table(table(new_titanic[,i]))
  barplot(freq_table, main=i, ylab="Proportion")
}

# Plot 3
ggplot(new_titanic, aes(Age, Fare)) + geom_point(aes(color = factor(Survived))) + facet_grid(Pclass ~ Sex)

# Plot 4
ggplot(new_titanic, aes(Sex, fill = Survived)) + geom_bar(position = "fill")

# Plot 5
ggplot(new_titanic, aes(SibSp, fill = Survived)) + geom_bar(position = "fill")

# Plot 6
ggplot(new_titanic, aes(Pclass, fill = Survived)) + geom_bar(position = "fill")

# Plot 7
ggplot(new_titanic, aes(Parch, fill = Survived)) + geom_bar(position = "fill")

# Plot 8
ggplot(new_titanic, aes(Embarked, fill = Survived)) + geom_bar(position = "fill")

# Plot 9
new_titanic$Age_Category <- cut(new_titanic$Age, breaks=c(0, 18, 64, max(new_titanic$Age)), 
                              labels=c("Anak", "Dewasa", "Lansia"))

ggplot(new_titanic, aes(Age_Category, fill = Survived)) + geom_bar(position = "fill")

# Plot 10
new_titanic$Fare_Category <- cut(new_titanic$Fare, breaks=c(0, 7.9, 14.45, 31.28, max(new_titanic$Fare)), 
                              labels=c("Low", "Mid", "High_Mid", "High"))

non_survivor = new_titanic[new_titanic$Survived == 0,]
survivor = new_titanic[new_titanic$Survived == 1,]

barplot(table(survivor$Fare_Category), main = "Survivor by passenger fare")
barplot(table(non_survivor$Fare_Category), main = "NonSurvivor by passenger fare")