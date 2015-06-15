## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function handles basic requirements of setting and getting matrix objects from the cache and setting and getting inverse of the same from the cache

makeCacheMatrix <- function(x = matrix()) {
## local inverse matrix object
  m <- NULL

## function to set the incoming matrix object to the x object and reset cache
  setmatrix <- function(y)
  {
    x <<- y
    m <<- NULL
  }
## function to return the matrix 
  getmatrix <- function() x

## function to store the inverse of main object in cache  
  setinverse <- function(inverse)
  {
     m <<- inverse
  }

## function to return the stored cache object  
  getinverse <- function() m 

  list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse,
  getinverse=getinverse)
}


## Write a short comment describing this function
## this function returns the inverse if it already exists in chache, otherwise computes the inverse stores the same in cache and returns the inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
## return existing cache if it is not empty
  if (!is.null(m)) {
     message("getting cached datta")
        return(m)
  }
  y <-x$getmatrix()
  x$setmatrix(y)
## calculate the inverse of matrix and return the same
  m <-solve(y, ...)
  x$setinverse(m)
  m
}

