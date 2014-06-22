##The following pair functions work in a ways that the first one creates a matrix object 
##that can cache its inverse and the second one computes this inverse. it retrieves the 
##the inverse from cache if at all the inverse has already been cached.

##This is a function that creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function( x = matrix() ){
        ##Initialize the inverse of this matrix to NULL 
        ## We will use the NULL value to test if this value is set or not
        matrix_inverse <- NULL
        
        ## Get the value of the matrix we are calculating
        callMatrix <- function(){
                x
        }
        
        ##cache the value we have, which will be the inverse for this case
        cacheInverse <- function(cache){
                matrix_inverse <<- cache
        }
        
        ## Return the inverse that we have
        ## This value is going to be NULL the first time we call this function
        returnInverse <- function(){
                matrix_inverse
        }
        
        ##a list can hold a number of things within it, therefore let's use list
        ##return a list which contains the inverse of the matrix we calculated
        list(callMatrix = callMatrix, returnInverse = returnInverse, callMatrix = callMatrix)
}


##This function will compute the inverse of the special "matrix" 
##returned by makeCacheMatrix. 
##If the inverse is already calculated and the matrix has not changed
##then cacheSolve retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ##Get the inverse if at all it exists
        inverse <- x$calculateInverse()
        
        ##If we found the inverse, we return it, else we go calculate it
        if(!is.null(inverse) && is.matrix(inverse)){
                message("Retrieving the inverse from cache")
                return(inverse)
        }
        
}