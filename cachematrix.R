# Matrix inversion is usually a costly computation and there may be some benefit to caching 
# the inverse of a matrix rather than compute it repeatedly. This pair of functions cache 
# the inverse of a matrix.

# Example matrix
example <- matrix(c(1:4),2,2)

# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()){
  
  invmatrix <- NULL
  
  set <- function(y){
    x <<- y
    invmatrix <<- NULL
  }
  get <- function() x
  setinversemat <- function(inversemat) invmatirx <<- inversemat
  getinversemat <- function() invmatrix
  list(set = set, get = get, setinversemat = setinversemat, getinversemat = getinversemat)
}


# computed
CacheMatrix <- makeCacheMatrix(example)

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix 
# above. If the inverse has already been calculated (and the matrix has not changed), then 
# the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...){
  invmatrix <- x$getinversemat()
  if(!is.null(invmatrix)){
    message("getting cached data")
    return(invmatrix)
  }
  data <- x$get()
  invmatrix <- solve(data)
  x$setinversemat(invmatrix)
  invmatrix
}

#cached
Result <- cacheSolve(CacheMatrix)

