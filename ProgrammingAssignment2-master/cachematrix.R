## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## X: a square invertible matrix
  ## return: a list with functions to
  ##              1. set the matrix
  ##              2. get the matrix
  ##              3. set the inverse
  ##              4. get the inverse
  ##         this list is inserted intoo cacheSolve()
makeCacheMatrix<-function(x=matrix())
{
inv<-NULL
set<-function(y)
{
   # use `<<-` to assign a value to an object in an environment different in which we are working
x<<-y
inv<<-NULL
}
get<-function() x
setInverse<-function(inverse) inv<<-inverse
getInverse<-function() inv
list(set=set,get=get,setInverse=setInverse,
getInverse=getInverse)
}



## Write a short comment describing this function
## return: inverse of the original matrix and the input to makeCacheMatrix()
cacheSolve<-function(x,...)
{
inv<-x$getInverse()
 ## if the inverse exists already, is already calculated
if(!is.null(inv))
{
message("getting cached data")
  # get it from the cache and skips the calculation part for which data already existed. 
return(inv)
}
 ## otherwise, calculates the inverse 
mat<-x$get()
inv<-solve(mat,...)
x$setInverse(inv)
}
