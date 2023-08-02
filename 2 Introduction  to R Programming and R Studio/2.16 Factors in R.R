#factors in R
#factor()

#creating a factor
data <- c("Male","Female","Female","Male","Others")
print(data)

factor_data <- factor(data)
print(factor_data)

print(nlevels(factor_data)) 


#changing the order of the levels

data <- c("East","West","South","West","East","East")

factor_data <- factor(data)
print(factor_data)


new_factor_data <- factor(factor_data, levels = c("West","East","South"))
print(new_factor_data)


#generating the factors levels

#syntax : gl(n,k, labels)

#example of generating levels
v<- gl(3,4, labels = c("West","East","North"))
print(v)
