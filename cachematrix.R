## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This is a function that creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        ##Initialize the inverse of this matrix to NULL (for memory concerns here)
        matrixInverse <- NULL
        
        ##this function will make available the matrix to other methods 
        getMatrix(){
                x
        }
        ##Defining a function to calculate the inverse
        calculateInverse <- function(){
                matrixInverse <<- solve(x)
        }
        
        ##This function is used to return the value of the inverse
        getInverse <- function(){
                matrixInverse
        }
}


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
        
        ##We didn't find any cached value for the matrix, so we have to solve it now
        ##Get the matrix using the get method
        theMatrix <- x$getMatrix
        
        ##calculate the inverse
        inverse <- solve(theMatrix, ...)
        x$calculateInverse()
        
        ##Finally we return the inverse
        inverse
}