## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  minv<-NULL
  set function(y){
    x<<-y
    xinv<<-NULL
  }
  get <- function() x
  setinv <- function(inv) xinv<<-inv
  getinv <-function() xinv
  list{set=set,get=get,setinv=setinv,getinv=getinv}
}


## Write a short comment describing this function

## Finds matrix inverse (if necessary) of special matrix
## created by above function and caches the result.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  xinv<-x$getinv()
  if(!is.null(xinv)){
    message("Returning cached data")
    return(xinv)
  }
  dat<-x$get() # retrieve matrix
  message("Computing matrix inverse and caching...")
  xinv<-solve(dat,...) # invert matrix with arguments for solve()
  x$setinv(xinv) #sets cached value
  message("done!")
  xinv # returns xinv
}
