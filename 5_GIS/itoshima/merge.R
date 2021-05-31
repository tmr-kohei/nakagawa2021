library("sf")
library("raster")
library("fgdr")

file <- list.files("./itoshima_plain_DEM/")
for (i in 1:length(file)) {
  f <- paste("./itoshima_plain_DEM/", file[i], sep="")
  r <- read_fgd_dem(f,
  resolution = 10,
  return_class = "raster")
  if ( i==1 ) {
    dem <- r
  } else {
    dem <- merge(dem, r, tolerance = 0.5)
  }
}
