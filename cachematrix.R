## Functionality for creating a wrapper around matrices for computing and
## caching the matrices inverse
## Styleguide: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

## Wrapper Object for matrices to support saving and retrieving matrix
## inverse
##
## Arguments
##   x - An invsersible matrix
##
## Example:
##   matrix <- makeCacheMatrix(matrix(c(1,0,5,2,1,6,3,4,0), ncol = 3))
##   matrix$get()
##   matrix$getInverse()
##   matrix$set(matrix(c(1,0,0,1), ncol = 2))
##   matrix$setInverse(matrix(c(1,0,0,1), ncol = 2))
##
## Returns a list of size 4 containing methods for setting 
## and getting the matrix and matrix inverses
makeCacheMatrix <- function(x = matrix()) {
  x.inverse <- NULL
  set <- function(matrix) {
    x <<- matrix
    x.inverse <<- NULL
  }

  get <- function() x
  setInverse <- function(inverse) x.inverse <<- inverse
  getInverse <- function() x.inverse

  list(set = set, get = get,
       setInverse = setInverse, getInverse = getInverse)
}

## Computes or retrieves the inverse of a "CacheMatrix"
##
## Arguments:
##   x   - a "CacheMatrix" containing an inversible matrix.
##   ... - Further arguments to the solve method
##
## Example:
##  cacheSolve(cacheMatrix)
##
## Returns a matrix that is the inverse of the argument matrix
cacheSolve <- function(x, ...) {
  x.inverse <- x$getInverse()
  if (!is.null(x.inverse)) {
    message("getting cached data")
    return(x.inverse)
  }

  x.inverse <- solve(x$get(), ...)
  x$setInverse(x.inverse)
  x.inverse
}