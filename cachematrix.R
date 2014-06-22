## Functionality for creating a wrapper around matrices for computing and
## caching the matrices inverse
## Style guide: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml

## Wrapper for matrices to support saving and retrieving matrix inverse
##
## Example:
##  matrix <- makeCacheMatrix(matrix(c(1,0,5,2,1,6,3,4,0), ncol = 3))
##  matrix$get()
##  matrix$getInverse()
##  matrix$set(matrix(c(1,0,0,1), ncol = 2))
##  matrix$setInverse(matrix(c(1,0,0,1), ncol = 2))
##
## Returns a list of size 4 containing the matrix and matrix inverses setters
## and getters
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


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}
