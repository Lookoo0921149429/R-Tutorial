#loading necessary library
library(sf)

#loading shapefile
dang <- st_read("D:/Data/dang_pop/dang_pop.shp")
dang

#filtering the features with family count greater than 8000
dang_fm_gt_8000 <- dang %>%
  filter(`Ttl_Fmly`>=8000)
dang_fm_gt_8000
plot(dang_fm_gt_8000['Ttl_Fmly'])

#filtering the features which are Gaunpalika
dang_gapa <-dang%>%filter(`GN_TYPE`=="Gaunpalika")
plot(st_geometry(dang_gapa))

#filtering the features which are not Gaunpalika
dang_not_gapa <- dang%>%filter(`GN_TYPE`!="Gaunpalika")
plot(st_geometry(dang_not_gapa))

#using and operator
#find the gapa_napa of dang with popn less than 50k or greater than 180k
dang_50k_180k <- dang%>%filter(Ttl_Ppl<50000 | Ttl_Ppl>180000)
plot(st_geometry(dang_50k_180k))
