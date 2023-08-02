#loading library ggplot2
library(ggplot2)

#creating data
data <- data.frame(
  name=c("A","B","C","D","E"),
  value=c(10,12,8,30,12)
)

#barplot
ggplot(data, aes(x=name, y=value))+
  geom_bar(stat="identity")


#horizontal barplot
ggplot(data, aes(x=name, y=value))+
  geom_bar(stat="identity")+
  coord_flip()


#controlling bar width

ggplot(data, aes(x=name, y=value))+
  geom_bar(stat="identity", width = 0.5)

