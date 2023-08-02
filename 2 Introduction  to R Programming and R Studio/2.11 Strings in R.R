# r strings

# rules

a <- "Thisis double quotes"
b <- 'This is single quote'
c <- 'This is a double qoutes " with in the single quote'
d <- "This is a single quote ' with in the double quote"
e <- "Blah Blah ' Blah "


#string manipulation

#paste()

a <- "Hello"
b <- "Nepal"
c <- "How are you?"

print(paste(a,b,c))
print(paste(a,b,c, sep = "-"))


#nchar - counting the number of characters
print(nchar("This is me Dinesh Bishwakarma"))

#toUpper and tolower
print(toupper("nepal"))
print(tolower("NEPAL"))


#extracting parts of a string - substring() function 

word <- "Extract"
print(substring(word,5,7))
