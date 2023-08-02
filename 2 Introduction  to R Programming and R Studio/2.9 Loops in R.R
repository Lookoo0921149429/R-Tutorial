#for loop
for(val in 1:5){
  print(val)
}

#for loop in vector
week <- c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")

for (day in week){
  print(day)
}


#while loop
val <- 1
while(val <= 10){
  print(val)
  val = val+1
}

#finding factorial using while loop
n <- 5
factorial <-1
i<-1
while(i<=n){
  factorial = factorial*i
  i=i+1
}

print(factorial)


#repeat loop
val <-1
repeat{
  print(val)
  val = val +1
  
  if(val>5){
    break
  }

}

