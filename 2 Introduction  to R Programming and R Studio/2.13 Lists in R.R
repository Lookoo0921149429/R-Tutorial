#list can be created using list() function

#creating a list
list1 <- list("Red","Green",c(21,31,11), TRUE, 51.23)
print(list1)


#naming the elements of list
list_data <- list(c("Jan","Feb","Marc"), matrix(c(3,9,5,1,-2,8), nrow=2), list("green", 12.3))

names(list_data) <- c("1st part","A_Matrix","A inner list")
print(list_data)


#accessing of list
list_data <- list(c("Jan","Feb","Marc"), matrix(c(3,9,5,1,-2,8), nrow=2), list("green", 12.3))
names(list_data) <- c("1st part","A_Matrix","A inner list")

print(list_data[1])

print(list_data[3])

#access the list element using the name of the element
print(list_data$A_Matrix)


#manipulating the list elements

#adding the element
list_data[4] <- "New Element"
print(list_data)


#remove the last element
list_data[4] <- NULL
print(list_data)


#updating the element
list_data[3] <- "This is updated"
print(list_data)



#merging the list
l1<- list(1,2,3)
l2<- list("Sun","Mon","Tues")
merged.list <- c(l1,l2)

print(merged.list)


#converting list to vector
list1 <- list(1:5)
print(list1)
list2 <- list(10,11,12,13,14)
print(list2)

v1<-unlist(list1)
v2<-unlist(list2)
print(v1)
print(v2)
print(v1+v2)
