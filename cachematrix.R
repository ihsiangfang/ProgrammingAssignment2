## a pair of functions one caches the inverse and one calculate the inverse

## to store a matrix and caches its inverse

makeCacheMatrix<- function(x = matrix()){
  inv<- NULL
  set<- function(y){
    x<<- y
    inv<<- NULL
  }
  get<- function() x
  setinv<- function(inverse) inv<<- inverse
  getinv<- function() inv
  list(set = set, get = get, 
       setinv = setinv, getinv = getinv)
}


## calculate the inverse and store it in the cache

cacheSolve<- function(x, ...){
  inv<- x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data<- x$get()
  inv<- solve(data, ...)
  x$setinv(inv)
  inv
}