## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL

  setmatrix <- function(y)
  {
    x <<- y
    m <<- NULL
  }
 
  getmatrix <- function() x
  
  setinverse <- function(inverse)
  {
     m <<- inverse
  }
  
  getinverse <- function() m 

  list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse,
  getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
     message("getting cached datta")
        return(m)
  }
  y <-x$getmatrix()
  x$setmatrix(y)
  m <-solve(y, ...)
  x$setinverse(m)
  m
}

