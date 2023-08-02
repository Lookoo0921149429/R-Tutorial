#creation of vector

vec <- c(1,2,3,4)

#accessing the vector

v <- c("Sun","Mon","Tue","Wed","Thurs","Fri","Sat")

#accessing the elements of vectors using position
print(v[c(2,3,7)])

#by using logical indexing
print(v[c(TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE)])


#by using negative indexing
print(v[c(-2,-5)])


#by using 0/1 indexing
print(v[c(0,0,1,0,0,0,1)])


#vector arithmetic
v1 <- c(2,3,5,6)
v2 <- c(1,5,9,1)

#vector addition
print(v1+v2)

#vector subtraction
#vector division
#vector multiplication

#vector recyling
v1 <- c(3,8,4,4,0,11)
v2 <- c(5,11)
#v2 <- c(5,11,5,11,5,11)
print(v1+v2)


#sorting of vectors
v1 <- c(3,8,4,4,0,11)
print(sort(v1))

#sorting in the reverse order
print(sort(v1, decreasing = TRUE))


#sorting character vector
v <- c("Cat","Dog","Apple")
print(sort(v))
