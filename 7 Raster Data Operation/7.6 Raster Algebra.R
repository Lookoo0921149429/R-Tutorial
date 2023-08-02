library(raster)
#creating empty raster
r <- raster(ncol=10, nrow=10)

#assigning values to cells
values(r) <- 1:ncell(r)

#plotting
plot(r)

#performing raster algebra
#adding a constant
s <- r+10
plot(s)
s

#square root
s<- sqrt(s)
plot(s)
s

#series of algebra
s <- s*r+10
s
plot(s)

#setting random numbers
r[]<- runif(ncell(r))
r
plot(r)

#rounding the value
r <-round(r)
r
plot(r)

#using replacement function
r[] <- runif(ncell(r))*10
plot(r)

r[r>=9]<- 10
r
plot(r)


r[r==10]<- -5
r
plot(r)


#performing raster algebra in raster stack
r[]<-1
s<- stack(r,r+1)
values(s)
q <- stack(r,r+2,r+4,r+6)
values(q)

x<- r+s+q
x
values(x)

#summary function
a <- mean(r,s,10)
a
values(a)

b<- sum(r,s)
values(b)

st <- stack(r,s,a,b)

sst <- sum(st)
values(sst)


#using cellStats if we want a single number summarizing the cell
#values of each layer

cellStats(sst,'sum')
cellStats(sst,'min')
cellStats(sst, 'mean')

