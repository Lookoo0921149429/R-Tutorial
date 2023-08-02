#loading library ggplot2
library(ggplot2)

#creating data
data <- data.frame(
  name=c("A","B","C","D","E"),
  value=c(10,12,8,30,12)
)

# Basic pie chart
ggplot(data, aes(x="", y=value, fill=name)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

#improving appearance
ggplot(data, aes(x="", y=value, fill=name)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0)+
  theme_void() #remove background, grid, numeric labels



