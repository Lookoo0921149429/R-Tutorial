library(raster)
library(sf)
library(whitebox)
library(tmap)

whitebox::wbt_init()

knitr::knit_hooks$set(webgl = hook_webgl)

theme_set(theme_classic())

tmap_mode("view")

setwd("D:/Data/watershed")

#loading data

dem <- raster("dem.tif", crs="+init=EPSG:4326")

#saving to disk after changing crs
writeRaster(dem, "dem_crs.tif", overwrite= TRUE)

tm_shape(dem_crs)+
  tm_raster(style="cont", palette = "PuOr", legend.show = TRUE)+
  tm_scale_bar()

#generating hillshade
dem_crs <- raster("dem_crs.tif")

wbt_hillshade(dem = file.path(getwd(), "dem_crs.tif"), 
              output = file.path(getwd(), "hillshade.tif"), 
              azimuth = 115)

hillshade <- raster("hillshade.tif")

tm_shape(hillshade)+
  tm_raster(style = "cont",palette = "-Greys", legend.show = FALSE)+
  tm_scale_bar()


#preparing DEM for hydrology analysis
#finding sink
wbt_breach_depressions_least_cost(
  dem = file.path(getwd(),"dem_crs.tif"),
  output = file.path(getwd(),"breached.tif"),
  dist=5,
  fill=TRUE
)

#filling DEM
wbt_fill_depressions_wang_and_liu(
  dem=file.path(getwd(),"breached.tif"),
  output=file.path(getwd(), "filled_breached.tif")
)

#creating flow accumulation and pointer grids
wbt_d8_flow_accumulation(input=file.path(getwd(), "filled_breached.tif"),
                         output=file.path(getwd(), "D8FA.tif")
                         )
D8FA <- raster("D8FA.tif")
tm_shape(D8FA)+
  tm_raster(style = "cont", palette = "-Greys", legend.show = FALSE)+
  tm_scale_bar()

wbt_d8_pointer(dem=file.path(getwd(),"filled_breached.tif"),
               output=file.path(getwd(),"D8Pointer.tif")
               )
tm_shape(raster("D8Pointer.tif"))+
  tm_raster(style = "cont", legend.show = TRUE)+
  tm_scale_bar()


#extracting streams 
wbt_extract_streams(
  flow_accum = file.path(getwd(),"D8FA.tif"),
  output = file.path(getwd(), "raster_streams.tif"),
  threshold=6000
) 

#snapping pour points
#we have snap points from external file that may be from the field collection

wbt_jenson_snap_pour_points(
  pour_pts = file.path(getwd(),"pourpoints.shp"),
  streams = file.path(getwd(), "raster_streams.tif"),
  output = file.path(getwd(), "snappedpp.shp"),
  snap_dist = 20
)


pp <- st_read("pourpoints.shp")
spp <- st_read("snappedpp.shp")
streams <- raster("raster_streams.tif")                

tm_shape(streams)+
  tm_raster(legend.show = TRUE, palette = "Blues")+
  tm_shape(spp)+
  tm_dots(col="red")+
  tm_shape(pp)+
  tm_dots(col = "black")


#delineate watersheds
wbt_watershed(d8_pntr = file.path(getwd(),"D8Pointer.tif"),
              pour_pts = file.path(getwd(), "snappedpp.shp"),
              output = file.path(getwd(), "watersheds.tif")
              )

ws <- raster("watersheds.tif")

tm_shape(hillshade)+
  tm_raster(style = "cont",palette = "-Greys", legend.show = FALSE)+
  tm_shape(ws)+
  tm_raster(legend.show = TRUE, alpha = 0.5, style = "cat")+
  tm_shape(pp)+
  tm_dots(col = "red")


