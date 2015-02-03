#Suppose I define the following function in R 
cube <- function(x, n) {
  x^3
}
# What is the result of running 'cube(3)' in R after defining this function?
#Answer: 27

f <- function(x) {
  g <- function(y) {
    y + z  # Lexical scoping, z will be taken from the parent context
  }
  z <- 4  
  x + g(x) #  (x <- 3) + (g(3) <- ((y <- 3) + (z <- 4))) == 10
}
# If I then run in R 
# > z <- 10
# > f(3)
# What value is returned?
# Answer: 10

# Consider the following R function 
h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}
# Which symbol in the above function is a free variable?
# Answer: f


