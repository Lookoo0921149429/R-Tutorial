#matrices in R
#matrix()

#syntax

#matrix(data, nrow, ncol, byrow, dimsnames)

#example

#elements arranged sequentially by row
M <- matrix(c(3:14), nrow=4, byrow="TRUE")
print(M)

#elements arranged sequentially bu column
M <- matrix(c(3:14), nrow=4, byrow="FALSE")
print(M)


#defining the column and row names
rownames <- c("row1","row2","row3","row4")
colnames <- c("col1","col2","col3")

P<- matrix(c(3:14), nrow=4, ncol=3 , byrow = TRUE, dimnames = list(rownames, colnames))
print(P)


#accessing the elements of a Matrix

print(P[1,3])
print(P[4,2])
print(P[2,])
print(P[,3])


#matrix computations


#matrix addition and subtraction

m1 <- matrix(c(3,9,1,4,2,6), nrow=2)
m2 <- matrix(c(5,2,0,9,3,4), nrow=2)
print(m1+m2)
print(m1-m2)
print(m1*m2)
print(m1/m2)

