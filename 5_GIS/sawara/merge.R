library("sf")
library("raster")
library("fgdr")

dir <- list.files("./sawara_plain_DEM/")
for (i in 1:length(dir)) {
  print( paste(i, "/", length(dir)) )
  dir2 <- paste("./sawara_plain_DEM/", dir[i], sep="")
  file <- list.files(dir2)
  for (j in 1:length(file)) {
    f <- paste("./sawara_plain_DEM/", dir[i], "/", file[j], sep="")
    r <- read_fgd_dem(f,
         resolution = 5,
         return_class = "raster")
    if ( (i==1)&&(j==1) ) {
      dem <- r
    } else {
      dem <- merge(dem, r, tolerance = 0.5)
    }
  }
}

#file <- list.files("./sawara_plain_DEM_10m/")
#for (i in 1:length(file)) {
#  f <- paste("./sawara_plain_DEM_10m/", file[i], sep="")
#  r <- read_fgd_dem(f,
#  resolution = 10,
#  return_class = "raster")
#  dem <- merge(dem, r, tolerance = 0.5)
#}
