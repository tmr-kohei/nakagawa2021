library("sf")
library("raster")
library("fgdr")

dir <- list.files("./east_tsukushi_DEM/")
for (i in 1:length(dir)) {
  print( paste(i, "/", length(dir)) )
  dir2 <- paste("./east_tsukushi_DEM/", dir[i], sep="")
  file <- list.files(dir2)
  for (j in 1:length(file)) {
    f <- paste("./east_tsukushi_DEM/", dir[i], "/", file[j], sep="")
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
