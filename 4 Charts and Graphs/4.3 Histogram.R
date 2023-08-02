#loading package
library(ggplot2)

#dataset
data = data.frame(value=rnorm(1000))

#basic histogram
p <- ggplot(data, aes(x=value))+
  geom_histogram()
p

#controlling bin size 
p <- ggplot(data, aes(x=value))+
  geom_histogram(binwidth = 0.3, fill="red", color="blue", alpha=0.5)+
  ggtitle("Bin size = 3")+
  theme(
    plot.title = element_text(size=15)
  )
p
