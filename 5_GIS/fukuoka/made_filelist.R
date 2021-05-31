result <- c()
dir <- list.files("./fukuoka_plain_DEM/")
for (i in 1:length(dir)) {
  print( paste(i, "/", length(dir)) )
  dir2 <- paste("./fukuoka_plain_DEM/", dir[i], sep="")
  file <- list.files(dir2)
  for (j in 1:length(file)) {
  f <- paste(dir[i], "/", file[j], sep="")
  result <- c(result, f)
  }
}
df <- data.frame(FileName=result)
write.csv(df, file="filelist.txt", quote=F, row.names=F)
