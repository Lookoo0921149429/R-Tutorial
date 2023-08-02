#reading csv files in R

#getting working directory
print(getwd())

#setting current working directory
print(setwd("D:/Organised Files/Geospatial Programming/Codes/Tutorial/data"))
print(getwd())


#reading csv file

data <- read.csv("data.csv")
print(data)


#analysing the csv file

print(is.data.frame(data))
print(ncol(data))
print(nrow(data))


#getting the maximum salary
sal<- max(data$salary)
print(sal)


#getting the detail of the person having maximum salary
max_sal_detail <- subset(data, salary==max(data$salary))
print(max_sal_detail)

#getting the people working in IT Department
worker_in_IT <- subset(data, dept=="IT")
print(worker_in_IT)


#getting the persons in IT department whose salary is > 600
info <- subset(data, salary>600 & dept=="IT")
print(info)

#writing the csv file
write.csv(info, "output.csv")

newdata <- read.csv("output.csv")
print(newdata)


#dropping X column
write.csv(info, "output1.csv", row.names = FALSE)
newdata <- read.csv("output1.csv")
print(newdata)

