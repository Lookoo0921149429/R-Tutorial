library(raster)

#creating raster layer with default parameters
x <- raster()
x

#with other parameters
x <- raster(ncol=36, nrow=18, xmn=-1000, xmx=1000, ymn=-100, ymx=900)

#checking resolution
res(x)
#changing resolution 
res(x) <-100
res(x)


#finding dimensions
ncol(x)
#chaning no of cols 
ncol(x)<-18
ncol(x)

res(x)


#setting crs
projection(x)<-"+proj=utm +zone=48 +datum=WGS84"
x


#x we created only consists of skeleton
#we have defined the number of rows and columns
#the raster is located in geographic space, but there are no cell values
#associated with it

#setting the values in cell
r <-raster(ncol=10, nrow=10)
ncell(r)

hasValues(r)

#using the 'values' function
set.seed(0)
values(r) <- runif(ncell(r))

hasValues(r)

values(r)[1:10]
plot(r)
