## These functions calculate the inverse of a matrix, using a cache to store the result the first time it is calculated

## This function creates a vector containing 4 functions : 
## Set or get the value of the matrix, set or get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
    x <<- y
    i <<- NULL
}
get <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list( set = set, get = get, setinverse = setinverse, getinverse = getinverse )
}


## This function calculate the inverse of the matrix, but first check if it has already been calculated.
## If so it gets the result from the cache instead of recalculate it 

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data,...)
    x$setinverse(i)
        ## Return a matrix that is the inverse of 'x'
    i
}
