# Exploratory Data Analysis of the Titanic Dataset using R
This is a repository for an Exploratory Data Analysis (EDA) project conducted on the Titanic dataset using R. The main goal of this project is to gain insights and knowledge from the data by analyzing and visualizing various aspects of the dataset, such as the passenger demographics, survival rates, ticket prices, cabin locations, and more. The dataset contains information on the passengers of the Titanic, including their age, sex, class, fare, cabin, and whether they survived or not.

The repository includes a PDF file explaining the EDA process and findings, an R script file containing the code used to perform the analysis, plots in PNG format, and insights gained from the EDA.

**Insights:**

* The Titanic dataset displays information about the passengers such as their class, name, sex, age, cabin, and others. The dataset is used to classify Titanic passengers into two survival states: 0 = not survive or 1 = survive based on the information given in the dataset.
* The dataset consists of 891 rows and 12 columns.
* The variables that have "character" as their data type are Name, Sex, Ticket, Cabin, and Embarked. The variables that have "numeric" as their data type are PassengerId, Survived, Pclass, SibSp, Parch, and Fare.
* The Age column has 177 missing values, and there are no duplicated rows in the dataset.
* There are seven outliers in the Age column and many in the Fare column.
* The dataset shows that more passengers did not survive than those who survived.
* Passenger class and gender are highly correlated with survival state, while age and passenger fare do not seem to be strongly correlated.
* Female passengers are more likely to survive.
* Young passengers are more likely to survive.
* Higher class passengers (1st class) are more likely to survive.
* The higher the fare, the more likely the passenger is to survive.
