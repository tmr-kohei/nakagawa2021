result <- c()
dir <- list.files("./east_tsukushi_DEM/")
for (i in 1:length(dir)) {
  print( paste(i, "/", length(dir)) )
  dir2 <- paste("./east_tsukushi_DEM/", dir[i], sep="")
  file <- list.files(dir2)
  for (j in 1:length(file)) {
    f <- paste(dir[i], "/", file[j], sep="")
    result <- c(result, f)
  }
}
df <- data.frame(FileName=result)
write.csv(df, file="filelist.txt", quote=F, row.names=F)
