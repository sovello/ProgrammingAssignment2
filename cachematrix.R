## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This is a function that creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        ##Initialize the inverse of this matrix to NULL (for memory concerns here)
        matrixInverse <- NULL
        
        ##This function is used to access the matrix we are working with
        
        ##Defining a function to get inverse
        calculateInverse <- function(){
                matrixInverse <<- solve(x)
        }
        
        ##This function is used to return the value of the mean
        getInverse <- function(){
                matrixInverse
        }
}


## Write a short comment describing this function
##This function will compute the inverse of the special "matrix" 
##returned by makeCacheMatrix. 
##If the inverse is already calculated and the matrix has not changed
##then cacheSolve retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ##Get the inverse if at all it exists
        inverse <- x$getInverse()
        
        ##If we found the inverse, we return it, else we go calculate it
        if(!is.null(inverse)){
                message("Retrieving the cached inverse")
                return(inverse)
        }
        
        theMatrix <- x$get
        
}