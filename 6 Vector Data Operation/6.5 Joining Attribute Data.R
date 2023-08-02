#loading library
library(sf)
library(dplyr)
library(xlsx)

setwd("D:/Data/")

#reading shapefile
dang <- st_read("Dang_Local_Level/Dang_Local_Level.shp")
dang
plot(st_geometry(dang))

#reading csv files
cbs_popn <- read.xlsx("CBS_Popn.xlsx", sheetIndex=1)
cbs_popn

#joining attributes
dang_popn <- left_join(dang, cbs_popn, by = c("PALIKA"="GaPa_NaPa"))
dang_popn
plot(dang_popn['Total.Population'])



