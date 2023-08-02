#loading library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/dang_popn/dang_popn.shp")

#getting minimum bounding box value
bbox_dang <- st_bbox(dang)
bbox_dang

#finding the range of x and y axis
xrange <- bbox_dang$xmax - bbox_dang$xmin
yrange <- bbox_dang$ymax - bbox_dang$ymin
xrange
yrange

#changing the bounding box values to get blank area on right and bottom

#commented sections are for left and top area
#bbox_dang[1] <- bbox_dang[1] - (0.25*xrange) #xmin - left
bbox_dang[3] <- bbox_dang[3] + (0.35*xrange) #xmax - right
bbox_dang[2] <- bbox_dang[2] - (0.25*yrange) #ymin - bottom
#bbox_dang[4] <- bbox_dang[4] + (0.2*xrange) #ymax - top


bbox_dang <- bbox_dang %>% #take the bounding box..
  st_as_sfc()

#defining the size of bubble by normalizing value
bubble_sizes <- ((c(10,20,30,40)*1e4)/25e4)*0.5*2
bubble_sizes

#plotting the shape
tm_shape(dang, bbox=bbox_dang)+
    tm_polygons()+
    
#plotting the dots
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
  )+
#adding the legend
  tm_add_legend('symbol',
                col = RColorBrewer::brewer.pal(4,"YlOrRd"),
                border.col = "grey40",
                size = bubble_sizes,
                labels = c('0-50 k','50-100 k','100-150k','150-250 k'),
                title = "Population"
                
  )+
#layouting to set elements position
    tm_layout(
    title = "Population Distribution",
    title.position = c("right","top"),
    legend.position= c("right","bottom"),
  )


