result <- c()
file <- list.files("./itoshima_plain_DEM/")
for (i in 1:length(file)) {
  f <- paste(file[i], sep="")
  result <- c(result, f)
}
df <- data.frame(FileName=result)
write.csv(df, file="filelist.txt", quote=F, row.names=F)
