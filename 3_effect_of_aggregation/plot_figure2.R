# make figure 2 in SI
# the frequency of violence is plotted against population pressure by each subregion
d <- read.csv("data.csv")
area <- unique(as.character(d$Area))
par(mfrow=c(3,2))
pch <- c(1,1,19,19,19,19)
for (i in 1:length(area)) {
  a <- area[i]
  # a panel is restricted to a subregion
  d.sub <- subset(d, d$Area==a)
  plot(d.sub$PopulationPressure, d.sub$InjuredIndividuals/d.sub$BurialJarPots,
  xlim=c(0,3.2), ylim=c(0, 0.018), type="b", pch=pch,
  xlab="Population pressure", ylab="Prop. of Injured Individuals", main=a)
  legend("topright", legend=c("not aggregated", "aggregated"), pch=c(1, 19))
}
dev.copy2eps(file="figure2.eps")
dev.off()
