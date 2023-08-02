#cell level functions
library(raster)

#creating a raster
r <- raster(ncol=10, nrow=10)
ncol(r)
nrow(r)
ncell(r)

#get the row value
rowFromCell(r,80)

#get the column value
colFromCell(r, 75)

#get the coordinates from a row, column or cell number
xyFromCell(r,54)

#get the cell number from a row and column
cellFromXY(r,c(0,0))

#get the column number from coordinate value
colFromX(r,-100)
rowFromY(r,0)



#accessing cell values
r<-raster(ncol=5,nrow=5)
values(r) <- runif(ncell(r))
r<- round(r*10)

ncell(r)
nrow(r)
ncol(r)

as.matrix(r)
#getting values 
v <- getValues(r,3)
v
v[2:5]

#get a block of raster cell values
getValuesBlock(r,2,2,3,3)


#reading cell values using cell numbers or coordinates (xy)
cells <- cellFromRowCol(r, 4,4)
cells

cells <- cellFromRowCol(r, 2,2:4)
cells

extract(r, cells)


#getting the xy values of cells
xy <- xyFromCell(r, cells)
xy
extract(r, xy)

#also
r[cells]
