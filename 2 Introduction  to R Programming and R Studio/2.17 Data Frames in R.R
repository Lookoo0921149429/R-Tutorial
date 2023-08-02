#data frames in R

#creating data frame
emp.data <- data.frame(
  emp_id = c(1:5),
 emp_name = c("Hari","Ram","Sita","Laxman","Ravan"),
 salary = c(30000,50000,40000,43689,25000),
 start_date = as.Date(c("2012-01-01","2015-03-28","2014-11-15","2016-10-10","2020-11-15")),
 stringsAsFactors = FALSE
)
print(emp.data)


#getting the structure of the data frame
str(emp.data)


#summary of the data frame
print(summary(emp.data))


#extract data from the data frame
result <- data.frame(emp.data$emp_name, emp.data$salary)
print(result)


#extract the first two rows and then all columns
print(emp.data[1:2,])

#extract the 3rd, 5th rows with column 2nd and 4th
print(emp.data[c(3,5),c(2,4)])


#expanding the data frame

#add the column

emp.data$dept <- c("IT","HR","IT","Finance","Operations")
v <- emp.data
print(v)


#adding the row
emp.newdata <- 	data.frame(
  emp_id = c (6:8), 
  emp_name = c("Rasmi","Pranab","Tusar"),
  salary = c(578.0,722.5,632.8), 
  start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
  dept = c("IT","Operations","Fianance"),
  stringsAsFactors = FALSE
)

#binding them 
emp.finalData <-rbind(emp.data, emp.newdata)
print(emp.finalData)
