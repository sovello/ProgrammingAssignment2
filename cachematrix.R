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


##This function will compute the inverse of the "matrix" from makeCacheMatrix if not found in cache, otherwise
##It will retrieve the inverse from cache
cacheSolve <- function(x, ...) {
        ##Get the inverse if at all it exists
        ## The first we call, this is going to be NULL
        matrix_inverse <- x$returnInverse()
        
        ##If we found the inverse from cache, we return it
        if(!is.null(matrix_inverse)){
                message("Retrieving the cached inverse")
                return(matrix_inverse)
        }
        
        ## If matrix_inverse is NULL, i.e. we did not find the inverse in cache, 
        ## get the "Matrix" so we calculate its inverse
        matrx <- x$callMatrix()
        
        ##calculate the Inverse
        matrix_inverse <- solve(matrx)
        
        ##cache the inverse, so we don't calculate the next time we get the same matrix
        x$cacheInverse(matrix_inverse)
        
        ##return the inverse
        matrix_inverse
}