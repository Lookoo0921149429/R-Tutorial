# Arrays in R

#array()

#create an array
a <- array(c(5,9,3,10,11,12,13,14,15), dim=c(3,3,2))
print(a)

#naming the columns, rows and matrix
v1 <- c(5,9,3)
v2 <- c(10,11,12,13,14,15)
colnames<- c("col1","col2","col3")
rownames<- c("row1", "row2","row3")
matnames <- c("matrix1","matrix2")

A <- array(c(v1,v2),dim=c(3,3,2), dimnames = list(rownames, colnames, matnames))
print(A)


#accessing the array elements

#printing the second row third column of second matrix
print(A[2,3,2])

#print the third row of the second matrix
print(A[3,,2])

#print the first matrix
print(A[,,1])


#manipulating array elements
A<- array(c(5,9,3,10,11,12,13,14,15), dim=c(3,3,2))

B <- array(c(9,1,0,6,0,11,3,14,1,2,6,9), dim = c(3,3,2))

mat1 <- A[,,2]
mat2 <- B[,,2]

print(mat1+mat2)


#calculations accross array elements

#syntax apply(x, margin, function)
A<- array(c(5,9,3,10,11,12,13,14,15), dim=c(3,3,2))
print(A)


result <- apply(A, c(1), sum)
print(result)
