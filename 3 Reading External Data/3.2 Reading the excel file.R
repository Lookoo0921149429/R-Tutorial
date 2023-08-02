#reading the excel file
# xls or xlsx

#packages -> XLConnect, xlsx, gdata etc.


#install xlsx library
install.packages("xlsx")


#verify the package is installed or not
any(grepl("xlsx", installed.packages()))



#loading the library
library("xlsx")

data <- read.xlsx("data.xlsx", sheetIndex = 1)
print(data)

print(is.data.frame(data))


#LOADING THE another worksheet by changing sheetIndex =2
data <- read.xlsx("data.xlsx", sheetIndex = 2)
print(data)
