# Q: How are free variables in R functions resolved? 
# A: The values of free variables are searched for in the environment in which the function was defined

# Q: In R, what is the parent frame?
# A: It is the environment in which a function was called

# The following code will produce a warning in R. 
> x <- 1:10
> if(x > 5) {
+ x <- 0
+ }
Warning message:
In if (x > 5) { :
  the condition has length > 1 and only the first element will be used
> # 'x' is a vector of length 10 and 'if' can only test a single logical statement.

> # Consider the following expression: 
> # What is the value of 'y' after evaluating this expression?
> x <- 5
> y <- if(x < 3) {
+     NA
+ } else {
+     10
+ }
> y
[1] 10
> 



