## makeCacheMatrix creates a special matrix object that can cache its inverse.
## makeCacheMatrix returns a list of functions that
## set -- set the value of matrix
## get -- get the value of the matrix
## setInverse -- set the Inverse of matrix
## getInverse -- get the Inverse of matrix
makeCacheMatrix_fw <- function(x = matrix()) {
  ## initialize the inverse variable to NULL at instantiation
  inv <- NULL
  ## set values of x and reset inv to NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  ## return matrix
  get <- function() x
  ## set the inverse of matrix
  setInverse <- function (inverse) inv <<- inverse
  ## return the inverse of matrix
  getInverse <- function() inv
  ##return list of functions
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
## CacheSolve computes the inverse of special matrix returned by makeCacheMatrix
## If inverse has been calculated, CacheSolve will get the inverse from cache
cacheSolve_fw <- function(x, ...) {
  #get inverse of x
  inv <- x$getInverse()
  ## if inv is not null, return inverse of x.. No computation required.
  if (!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  ## inv is null. Need to compute inverse of x
  ## get values of matrix x
  data <- x$get()
  ## solve of x
  inv <- solve(data, ...) # BUG
  ## set and cache the inverse of x
  x$setInverse(inv)
  ## Return a matrix that is the inverse of 'x'
  inv
}