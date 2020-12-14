# Examples

## Simple Linear Regression

Simple linear regression is a statistical method that allows us to summarize and study relationships between two continuous (quantitative) variables:

- One variable, denoted x, is regarded as the predictor, explanatory, or independent variable.
- The other variable, denoted y, is regarded as the response, outcome, or dependent variable.


The example shows the following

First indicate where to work and import the dataset

```R
getwd()
setwd( "/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataM
ining/MachineLearning/SimpleLinearRegression" )
getwd()
dataset <- read.csv( 'Salary_Data.csv' )
```

The dataset is divided with catools, indicating that we want the division to be ⅔, with this
is saved in a training dataset and a test dataset
```R
library (caTools)
set.seed( 123 )
split <- sample.split(dataset$Salary, SplitRatio = 2 / 3 )
training_set <- subset(dataset, split == TRUE )
test_set <- subset(dataset, split == FALSE )
```

A formula is created to obtain the indicated data from the dataset, applying the subtraction.
```R
regressor = lm(formula = Salary ~ YearsExperience,
data = dataset)
summary(regressor)
```
The data is predicted with the training set.

```R
y_pred = predict(regressor, newdata = test_set)
 ```
 The training data is visualized with ggplot2, creating a graph where the line
be on the x-axis the years of experience and on the y-axis be the value to be predicted, using what
previously it was done. Points that come directly from the
dataset, with the x-axis being years of experience and the y-axis being salary.
The blue color is indicated for the line and the red points, as well as that it will have the title and
the labels of each axis.
```R
library (ggplot2)
ggplot() +
geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
color = 'red' ) +
geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,
newdata = training_set)),
color = 'blue' ) +
ggtitle( 'Salary vs Experience (Training Set)' ) +
xlab( 'Years of experience' ) +
ylab( 'Salary' )
 ```
 
Now the same is done for the test dataset, in this case the points will be
extracted from the test dataset, while the line will remain from the test dataset training.
```R
ggplot() +
geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
color = 'red' ) +
geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,
newdata = training_set)),
color = 'blue' ) +
ggtitle( 'Salary vs Experience (Test Set)' ) +
xlab( 'Years of experience' ) +
ylab( 'Salary' )
```

# Multiple Linear Regression

Multiple linear regression (MLR), also known simply as multiple regression, is a statistical technique that uses several explanatory variables to predict the outcome of a response variable. The objective of multiple linear regression (MLR) is to model the linear relationship between the explanatory variables (independent) and the response variable (dependent).

The example shows the following

First indicate where to work and import the dataset

```R
getwd()
setwd( "/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataM
ining/MachineLearning/MultipleLinearRegression" )
getwd()
dataset <- read.csv( '50_Startups.csv' )
```
In order to work with this data, you need to change values ​​of the column
alphanumeric to numeric status.
```R
dataset$State = factor(dataset$State, levels = c( 'New York' ,
'California' , 'Florida' ), labels = c( 1 , 2 , 3 ))
```
Now, the catools library is used to divide the dataset into two parts, being the
column profit where we will be based, the first part will be training_set and the
second the test_set, for this it is indicated that the ratio must be 0.8, which means
that this fraction will be taken.
```R
library (caTools)
set.seed( 123 )
split <- sample.split(dataset$Profit, SplitRatio = 0.8 )
training_set <- subset(dataset, split == TRUE )
test_set <- subset(dataset, split == FALSE )
```
the data of the training set are adapted to make the linear regression
multiple.
```R
regressor = lm(formula = Profit ~ ., data = training_set )
summary(regressor)
```
The prediction of the above adequacy is obtained using the training set.
```R
y_pred = predict(regressor, newdata = test_set)
y_pred
```
The model does not fit the best, so an improved formula is created.

It can be done in two ways:

## Form 1
Eliminating and checking one by one, verifying which are the fields that
they have less weight and can alter the result, so a value is removed by
each check, to be removed, must have the fewest asterisks.

```R
regressor = lm(formula = Profit ~ R.D.Spend + Administration +
Marketing.Spend + State, data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration +
Marketing.Spend, data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
data = dataset )
summary(regressor)
```
With this you get a better prediction.
```R
y_pred = predict(regressor, newdata = test_set)
y_pred
```

## Form 2
The other way to solve this is to create a function, which will do what
just performed, this function should only receive the training set and the
minimum value that should be of importance.
```R
backwardElimination <- function (x, sl) {
```
Inside the function, the following is done:
the length of the dataset is obtained, which is the columns.
```R
numVars = length(x)
```
In a for loop, each column will be iterated.
```R
for (i in c( 1 :numVars)){
```
It is done as before, a filtering is done.
```R
regressor = lm(formula = Profit ~ ., data = x)
```
Then the maximum value is obtained, extracting the coefficients of the previous filtering,
choosing only column Pr (> | t |)
 ```R
 maxVar = max(coef(summary(regressor))[c( 2 :numVars), "Pr(>|t|)" ])
 ```
If the value obtained is greater than the minimum value indicated then the
modifies by the value obtained in j in the dataset x.
```R
if (maxVar > sl){
j = which(coef(summary(regressor))[c( 2 :numVars), "Pr(>|t|)" ]
== maxVar)
x = x[, -j]
}
```
A value is subtracted from numvars
```R
numVars = numVars - 1
}
```
The values ​​that have been greater than the minimum value indicated are displayed.
```R
return (summary(regressor))
}
```

# Logistic Regression

In statistics, logistic regression is a type of regression analysis used to predict the outcome of a categorical variable (a variable that can take on a limited number of categories) based on the independent or predictor variables. It is useful for modeling the probability of an event occurring as a function of other factors.

The example shows the following


It is indicated first where the work will be done and the dataset is imported
```R
getwd()
setwd( "/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataM
ining/MachineLearning/LogisticRegression" )
getwd()
dataset <- read.csv( 'Social_Network_Ads.csv' )
dataset <- dataset[, 3 : 5 ]
```
The dataset is divided with catools, indicating that we want the division to be 0.75, with
this is saved in a training dataset and a test dataset.
```R
library (caTools)
set.seed( 123 )
split <- sample.split(dataset$Purchased, SplitRatio = 0.75 )
training_set <- subset(dataset, split == TRUE )
test_set <- subset(dataset, split == FALSE )
```
Matrices are scaled.
```R
training_set[, 1 : 2 ] <- scale(training_set[, 1 : 2 ])
test_set[, 1 : 2 ] <- scale(test_set[, 1 : 2 ])
```
regression is filtered to training dataset
```R
classifier = glm(formula = Purchased ~ ., family = binomial, data =
training_set)
```
the prediction is made to the test dataset
```R
prob_pred = predict(classifier, type = 'response' , newdata =
test_set[- 3 ])
prob_pred
y_pred = ifelse(prob_pred > 0.5 , 1 , 0 )
y_pred
```
the confusion matrix is ​​performed.
```R
cm = table(test_set[, 3 ], y_pred)
cm
```
It is graphed with ggplot how the curve would look and the points indicating different shapes the X axis and Y axis for the points, while for the curve the method and family are indicated that belongs to the data.
 ```R
library (ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point()
+
stat_smooth(method= "glm" , method.args=list(family= "binomial" ),
se= FALSE )
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() +
stat_smooth(method= "glm" , method.args=list(family= "binomial" ),
se= FALSE )
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() +
stat_smooth(method= "glm" , method.args=list(family= "binomial" ),
se= FALSE )
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() +
stat_smooth(method= "glm" , method.args=list(family= "binomial" ),
se= FALSE )
 ```
 Now the results are displayed. For this, the elemstatlearn library is used
```R
library (ElemStatLearn)
```
The training set is passed to a variable
```R
set = training_set
```
The area where it will be graphed is created, indicating the minimum and maximum value of the grid.
```R
X1 = seq(min(set[, 1 ]) - 1 , max(set[, 1 ]) + 1 , by = 0.01 )
X2 = seq(min(set[, 2 ]) - 1 , max(set[, 2 ]) + 1 , by = 0.01 )
grid_set = expand.grid(X1, X2)
```
The names of the x-axis and y-axis are indicated
```R
colnames(grid_set) = c( 'Age' , 'EstimatedSalary' )
```
a prediction is made with the linear regression previously performed
```R
prob_set = predict(classifier, type = 'response' , newdata = grid_set)
```
the values ​​are cataloged, if they are greater than 0.5, then the y-axis is 1, if not, it is 0
```R
y_grid = ifelse(prob_set > 0.5 , 1 , 0 )
```
It is graphical indicating the title, labels of the x-axis and y-axis, as well as setting the limits of X.
```R
plot(set[, - 3 ],
main = 'Logistic Regression (Training set)' ,
xlab = 'Age' , ylab = 'Estimated Salary' ,
xlim = range(X1), ylim = range(X2))
```
Limits indicating a region are plotted in contour mode
```R
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
= TRUE )
```
Points are drawn for each dataset value.
```R
points(grid_set, pch = '.' , col = ifelse(y_grid == 1 , 'springgreen3' ,
'tomato' ))
points(set, pch = 21 , bg = ifelse(set[, 3 ] == 1 , 'green4' , 'red3' ))
```
The same is done but now with the training data, only the dataset is changed to the test one.
```R
library (ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1 ]) - 1 , max(set[, 1 ]) + 1 , by = 0.01 )
X2 = seq(min(set[, 2 ]) - 1 , max(set[, 2 ]) + 1 , by = 0.01 )
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c( 'Age' , 'EstimatedSalary' )
prob_set = predict(classifier, type = 'response' , newdata = grid_set)
y_grid = ifelse(prob_set > 0.5 , 1 , 0 )
plot(set[, - 3 ],
main = 'Logistic Regression (Test set)' ,
xlab = 'Age' , ylab = 'Estimated Salary' ,
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
= TRUE )
points(grid_set, pch = '.' , col = ifelse(y_grid == 1 , 'springgreen3' ,
'tomato' ))
points(set, pch = 21 , bg = ifelse(set[, 3 ] == 1 , 'green4' , 'red3' ))
```
# KNN
K-Nearest-Neighbor is a Machine Learning supervised type instance-based algorithm. It can be used to classify new samples (discrete values) or to predict (regression, continuous values).

The example shows the following

The dataset is imported and only columns 3 and 5 are chosen
```R
dataset = read.csv( 'Social_Network_Ads.csv' )
dataset = dataset[ 3 : 5 ]
```

Encoding the target function as a factor
```R
dataset$Purchased = factor(dataset$Purchased, levels = c( 0 , 1 ))
```

The dataset is divided into Training set and Test set with catools
```R
library (caTools)
set.seed( 123 )
split = sample.split(dataset$Purchased, SplitRatio = 0.75 )
training_set = subset(dataset, split == TRUE )
test_set = subset(dataset, split == FALSE )
```
Matrices are scaled
```R
training_set[- 3 ] = scale(training_set[- 3 ])
test_set[- 3 ] = scale(test_set[- 3 ])
```
KNN adaptation to the training set and prediction of the results of the
test set
```R
library (class)
y_pred = knn(train = training_set[, - 3 ], test = test_set[, - 3 ], cl = training_set[, 3 ], k = 5 , prob = TRUE )
```
Creating the confusion matrix.
```R
cm = table(test_set[, 3 ], y_pred)
```
Now the results are displayed. For this, the elemstatlearn library is used.
```R
library (ElemStatLearn)
```
The training set is passed to a variable
```R
set = training_set
```
The area where it will be graphed is created, indicating the minimum and maximum value of the grid.
```R
X1 = seq(min(set[, 1 ]) - 1 , max(set[, 1 ]) + 1 , by = 0.01 )
X2 = seq(min(set[, 2 ]) - 1 , max(set[, 2 ]) + 1 , by = 0.01 )
grid_set = expand.grid(X1, X2)
```
The names of the x-axis and y-axis are indicated
```
colnames(grid_set) = c( 'Age' , 'EstimatedSalary' )
```
The knn is performed to split the training dataset
```
y_grid = knn(train = training_set[, - 3 ], test = grid_set, cl =
training_set[, 3 ], k = 5 )
```
It is graphical indicating the title, labels of the x-axis and y-axis
```R
plot(set[, - 3 ],
main = 'K-NN (Training set)' ,
xlab = 'Age' , ylab = 'Estimated Salary' ,
```
It sets the limits of X and Y
```R
xlim = range(X1), ylim = range(X2))
```
Limits indicating a region are plotted in contour mode
```R
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
= TRUE )
```
Points are drawn for each dataset value
```R
points(grid_set, pch = '.' , col = ifelse(y_grid == 1 , 'springgreen3' ,
'tomato' ))
points(set, pch = 21 , bg = ifelse(set[, 3 ] == 1 , 'green4' , 'red3' ))
```
To view with the test dataset, the same procedure is performed
```R
library (ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1 ]) - 1 , max(set[, 1 ]) + 1 , by = 0.01 )
X2 = seq(min(set[, 2 ]) - 1 , max(set[, 2 ]) + 1 , by = 0.01 )
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c( 'Age' , 'EstimatedSalary' )
y_grid = knn(train = training_set[, - 3 ], test = grid_set, cl =
training_set[, 3 ], k = 5 )
plot(set[, - 3 ],
main = 'K-NN (Test set)' ,
xlab = 'Age' , ylab = 'Estimated Salary' ,
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add
= TRUE )
points(grid_set, pch = '.' , col = ifelse(y_grid == 1 , 'springgreen3' ,
'tomato' ))
points(set, pch = 21 , bg = ifelse(set[, 3 ] == 1 , 'green4' , 'red3' ))
```

# Decision Tree Classification
```R
getwd()
setwd("C:/Users/Hp/Downloads/DataMining-master/MachineLearning/DesicionThree")
getwd()
```
Importing the dataset
```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

Encoding the target feature as factor
```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Splitting the dataset into the Training set and Test set
```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Feature Scaling
```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

Fitting Decision Tree Classification to the Training set
```R
library(rpart)
classifier = rpart(formula = Purchased ~ .,
                   data = training_set)
```

Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```
Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```

Visualising the Training set results
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Plotting the tree
```R
plot(classifier)
text(classifier, cex=0.6)
```

# Random Forest
```R
getwd()
setwd("C:/Users/Hp/Downloads/DataMining-master/MachineLearning/RandomForest")
getwd()
```
Importing the dataset
```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

Encoding the target feature as factor
```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Splitting the dataset into the Training set and Test set
```R
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Feature Scaling
```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

Fitting Random Forest Classification to the Training set
```R
install.packages('randomForest')
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)
```

Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```

Visualising the Training set results
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Choosing the number of trees
```R
plot(classifier)
```

# SVM

Importing the dataset
```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

Encoding the target feature as factor
```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

Splitting the dataset into the Training set and Test set
```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Feature Scaling
```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

Fitting SVM to the Training set
```R
install.packages('e1071')
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm
```

Predicting the Test set results
```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

Making the Confusion Matrix
```R
cm = table(test_set[, 3], y_pred)
cm
```

Visualising the Training set results
```R
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

Visualising the Test set results
```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

# K-Means
```R
getwd()
setwd("C:/Users/Hp/Downloads/DataMining-master/MachineLearning/K-Means")
getwd()
```

Importing the dataset
```R
dataset = read.csv('Mall_Customers.csv')
dataset = dataset[4:5]
```

Using the elbow method to find the optimal number of clusters
```R
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```

Fitting K-Means to the dataset
```R
set.seed(29)
kmeans = kmeans(x = dataset, centers = 5)
y_kmeans = kmeans$cluster
```

Visualising the clusters
```R
install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
         
```
