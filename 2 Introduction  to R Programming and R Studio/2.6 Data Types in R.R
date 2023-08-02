#logical data type
v <- TRUE
print(v)
print(class(v))

#numeric  data type

v<-12.5
print(v)
print(class(v))

#integer  data type
v <- 250L
print(v)
print(class(v))

#complex  data type
v <- 3+3i
print(v)
print(class(v))


#character  data type
v <- "Nepal"
print(class(v))


#raw  data type
v <- charToRaw("Hello")
print(v)
print(class(v))


#vector  data type
vec <- c("apple","ball","cat")
print(vec)
print(class(vec))

#list  data type
list1 <- list(12.5, "Cat", c(2,3,4))
print(list1)
print(class(list1))


#matrices data type
M <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
print(M)
print(class(M))


#arrays  data type
a <- array(c('apple','orange'), dim = c(3,3,2))
print(a)


#factors  data type
gender <- c('male','female','female','male','others')
factor_gender <- factor(gender)
print(factor_gender)
print(nlevels(factor_gender))


#data frame  data type
BMI <- data.frame(
  gender=c("Male","Female","Male"),
  height = c(152,171.5,165),
  weight = c(81,93,35),
  age = c(42,36,25)
)
print(BMI)
