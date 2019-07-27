setwd("C:/Rlab/data-kim")
factory_trash <- read.csv("2015년_사업장배출시설폐기물_처리현황.csv")
factory_trash$id <-0:16
factory_trash$total_trash<-factory_trash$자치단체_매립.톤.일.+factory_trash$자치단체_소각.톤.일.+factory_trash$자치단체_재활용.톤.일.+factory_trash$자치단체_해역배출.톤.일.+factory_trash$처리업체_매립.톤.일.+factory_trash$처리업체_소각.톤.일.+factory_trash$처리업체_재활용.톤.일.+factory_trash$처리업체_해역배출.톤.일.+factory_trash$자가처리_매립.톤.일.+factory_trash$자가처리_소각.톤.일.+factory_trash$자가처리_재활용.톤.일.+factory_trash$자가처리_해역배출.톤.일.
factory_trash$recycle_rate<-(factory_trash$자치단체_재활용.톤.일.+factory_trash$처리업체_재활용.톤.일.+factory_trash$자가처리_재활용.톤.일.)/factory_trash$total_trash*100
glimpse(factory_trash)

install.packages("ggmap")
install.packages("raster")
install.packages("rgeos")
install.packages("maptools")
install.packages("rgdal")
library(ggmap)
library(ggplot2)
library(raster)
library(rgeos)
library(maptools)
korea<-shapefile("TL_SCCO_CTPRVN.shp")
korea<-spTransform(korea, CRS("+proj=longlat"))
korea_map<-fortify(korea)
merge_result<-merge(korea_map, factory_trash, by = "id")
ggplot() + geom_polygon(data=merge_result, aes(x=long, y=lat, group=group, fill=recycle_rate))+labs(fill="발생량 대비 재활용 비율(%)")

