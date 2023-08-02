#built in function

#seq()
print(seq(5,30))

#mean()
print(mean(5:30))

#sum()
print(sum(5:30))


#user defined functions

#function_name <-function(arg1, arg2,...argn){
# function body
# return body
# }



sumOfTwoDigits <- function(a,b){
  sum = a+b
  print(sum)
}

sumOfTwoDigits(5,10)

#function without argument

new.function <- function(){
  for(i in 1:5){
    print(i^2)
  }
}

new.function()

#function with default arguments
simpleInterest <- function(p,t,r=10){
  si = (p*t*r)/100
  print(si)
}

simpleInterest(2000,2,5)
simpleInterest(2000,2)

#function with return value

sum1<- function(a,b){
  return(a+b)
}
a<-sum1(5,6)
print(a)
