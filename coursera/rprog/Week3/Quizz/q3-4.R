#Load the 'mtcars' dataset in R with the following code 
library(datasets)
data(mtcars)

#There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
?mtcars

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
with(mtcars, tapply(mpg, cyl, mean))

#Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
with(mtcars, tapply(hp, cyl, mean))

abs(mean(mtcars$hp[mtcars$cyl == 4]) - mean(mtcars$hp[mtcars$cyl == 8]))

#[1] 126.5779