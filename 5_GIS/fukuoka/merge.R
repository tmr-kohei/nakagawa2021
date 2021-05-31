library("sf")
library("raster")
library("fgdr")

dir <- list.files("./fukuoka_plain_DEM/")
for (i in 1:length(dir)) {
  print( paste(i, "/", length(dir)) )
  dir2 <- paste("./fukuoka_plain_DEM/", dir[i], sep="")
  file <- list.files(dir2)
  for (j in 1:length(file)) {
    f <- paste("./fukuoka_plain_DEM/", dir[i], "/", file[j], sep="")
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
