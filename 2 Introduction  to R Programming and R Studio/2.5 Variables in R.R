#assigning values to variables
a = 5
print(a)

#another way of assigning values to variable (left assignment operator)
a <- 7
print(a)

#another way of assigning values to variable (right assignment operator)
9 -> a
print(a)

#dot can be used in the name of variable
first.name <- "Dinesh"

#number can not be used at the front
1name <- "Dinesh"


.name <- "Hari"  #dot can be used at the front
.2name <-"Ram"   #but number can't be used after . when . is used at the front


#unserscore _ can not be used at front
_name <- "Sita"

#finding the data type of object
x <- "Hello"
class(x)


x <- 12.5
class(x)

x <- 12
class(x)

#integer data type
x<-12L
class(x)

#printing the all the variable name
print(ls())

#removing a variable
rm(a)
print(ls())
