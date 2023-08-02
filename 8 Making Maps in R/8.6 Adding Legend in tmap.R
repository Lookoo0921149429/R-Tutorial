#loading library
library(tmap)
library(sf)

#loading data
dang <- st_read("D:/Data/dang_popn/dang_popn.shp")
as.matrix(data)

#defining the size of bubble by normalizing value
bubble_sizes <- ((c(10,20,30,40)*1e4)/25e4)*0.5*2
bubble_sizes

#plotting shape
tm_shape(dang)+
  tm_polygons()+
  tm_shape(dang)+
#plotting symbols
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
#adding legends
  tm_add_legend('symbol',
                col = RColorBrewer::brewer.pal(4,"YlOrRd"),
                border.col = "grey40",
                size = bubble_sizes,
                labels = c('0-50 k','50-100 k','100-150k','150-250 k'),
                title = "Population"
                
                )+
  tm_layout(legend.position= c("left","bottom"))

