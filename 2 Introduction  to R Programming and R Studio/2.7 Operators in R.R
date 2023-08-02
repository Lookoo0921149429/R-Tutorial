#operators in R

#arithmetic operators
a <- c(2,3,4)
b <- c(5,6,7)
print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%%b)
print(a%/%b)
print(b%/%a)
print(a^b)


#relational operators
a <-c(1,6,12)
b<- c(2,1,3)
print(a>b)
print(a<b)
print(a==b)
print(a!=b)

#logical operators
a<-c(3,1,TRUE, 2+3i)
b<-c(4,1,FALSE, 2+3i)
print(a&b)
print(a|b)
print(!a)

print(a&&b)

#assignment operators
v1 <- c(3,1,2,TRUE, 2+3i)
v2<<- c(1,2,3)
v3 = c(2,3,4,5)

c(2,3,5,7,9) -> v4
print(v4)

#miscellaneous operators
v <- 2:8
print(v)

a <- 5

#%in% | in operator
print(a%in%v)
print(10%in%v)

#%*% 
M = matrix(c(2,6,5,1,8,4), nrow=2 , ncol=3, byrow=TRUE)
t = M%*%t(M)
print(t)
