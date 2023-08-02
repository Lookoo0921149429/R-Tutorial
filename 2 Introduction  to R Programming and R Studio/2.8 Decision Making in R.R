#if statement
a <- 10
if(a<0){
  print("This is a negative number")
}


#if ... else statement
b <- 8
if(b<0){
  print("This is negative number")
}else{
  print("This is a positive number")
}


#switch

#switch(expression, case1, case2, .... case9)

c <- 3

d <- switch(c,
       "One",
       "Two",
       "Three",
       "Four")

print(d)


#switch with string expression
word <- "Nepal"

output <- switch(word,
                 "Nepal"="This is a beautiful Country",
                 "India"="This is neighbouring country of Nepal",
                 "China"="This is biggest among the Nepal and India"
                 
                 )
print(output)
