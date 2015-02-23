#Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code
library(datasets)
data(iris)

#A description of the dataset can be found by running
?iris

#There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? (Please only enter the numeric result and nothing else.)
mean((iris[iris$Species == "virginica",])$Sepal.Length)

#Answer:
#[1] 6.588

#Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)

#Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#5.843333     3.057333     3.758000     1.199333