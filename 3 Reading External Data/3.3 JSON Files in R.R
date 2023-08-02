#json files in R

#rjson package


#install rjson package

install.packages("rjson")


#reading the json file
library("rjson")

result <- fromJSON(file = "data.json")
print(result)

#convert json to a data frame
json_data_frame <- as.data.frame(result)
print(json_data_frame)
