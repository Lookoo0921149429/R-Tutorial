#loading library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/dang_popn/dang_popn.shp")

#getting the bounding box
bbox_dang <- st_bbox(dang)
bbox_dang

#changing the bounding box values to get blank area on left and bottom
xrange <- bbox_dang$xmax - bbox_dang$xmin
yrange <- bbox_dang$ymax - bbox_dang$ymin
xrange
yrange

#bbox_dang[1] <- bbox_dang[1] - (0.25*xrange) #xmin - left
bbox_dang[3] <- bbox_dang[3] + (0.35*xrange) #xmax - right
bbox_dang[2] <- bbox_dang[2] - (0.25*yrange) #ymin - bottom
#bbox_dang[4] <- bbox_dang[4] + (0.2*xrange) #ymax - top

bbox_dang <- bbox_dang %>% #take the bounding box..
  st_as_sfc()

#defining the size of bubble by normalizing value
bubble_sizes <- ((c(10,20,30,40)*1e4)/25e4)*0.5*2
bubble_sizes

#plotting the shapefile
tm_shape(dang, bbox=bbox_dang)+
    tm_polygons()+
#plotting the bubble symbols
  tm_symbols(col="Ttl_Ppl",
             breaks = c(0,5,10,15,25)*1e4,
             n=4,
             palette = 'YlOrRd',
             size = "Ttl_Ppl",
             sizes.legend = c(10,20,30,40)*1e4,
             size.lim = c(0,25e4),
             scale=2,
             legend.size.show = FALSE,
             legend.col.show = FALSE,
             legend.size.is.portrait = TRUE
  )+tm_graticules( #adding the graticules
      x=NA,
      y=NA,
      n.x=7, #a pretty sequence is used, so the number of actual labels may be different than n.x
      n.y=5,
      labels.show = TRUE,
      labels.size =0.5,
  )+
  tm_add_legend('symbol', #adding legend
                col = RColorBrewer::brewer.pal(4,"YlOrRd"),
                border.col = "grey40",
                size = bubble_sizes,
                labels = c('0-50 k','50-100 k','100-150k','150-250 k'),
                title = "Population"
                
  )+tm_layout( #layouting
    title = "Population Distribution",
    title.position = c("right","top"),
    legend.position= c("right","bottom"),
    bg.color = "skyblue",
  )+tm_compass( #adding compass
        north = 0,
        type="4star",
        size = 1.5,
        show.labels = 2,
        cardinal.directions = c("North","East","South","East"),
        text.color = "black",
        lwd=0.2,
        position = c("right","top"),
        
    )+tm_scale_bar( #adding scalebar
        breaks = c(0,5,10,15,30),
        text.color = "red",
        lwd=1,
        position = c("left","bottom"),
        text.size = 1
    )



