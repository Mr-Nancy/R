# The following functions instantiate a function to store cached inverse matrices
# makeCacheMatrix - set and get the value of the matrix
makeCacheMatrix_nd <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
## This function tries to get an existing inverse value if
## available to save on processing time
cacheSolve_nd <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  #check if the inverse exists
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #take the matrix and invert it via solve
  data <- x$get()
  m <- solve(data, ...)
  #set the solution in to the cache
  x$setinverse(m)
  m
}