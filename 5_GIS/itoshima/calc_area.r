source("merge.R")

#set the EPSG code
r <- dem
r <- raster::projectRaster(r, crs = CRS( "+init=epsg:4326" ) )
r[r==-9999] <- NA
slp <- terrain(r, opt = "slope", unit = "degrees")

#read the shape files
shp <- shapefile('shape/itoshima.shp')
crs(shp) <- CRS("+init=epsg:4326")

#mask
mask <- mask(slp, shp)
mask2 <- mask
mask2[mask2>5] <- NA
mask.sub <- mask(mask, mask2)

#convert the rasters to polygons
poly <- rasterToPolygons(mask2)

#calculate the area of polygons
area.poly <- area(poly, na.rm==TRUE)
area.value <- sum(area.poly)/1000/1000
