# make figure 1 in SI
# the frequency of violence is plotted against population pressure.
# Each points are colored depending on whether or not the data point is aggregated
d <- read.csv("data.csv")
pch <- c()
# data points are colored depending on that the time length is shorter than 30 years (not aggregated) or not (aggregated).
for (i in 1:nrow(d)) {
  if (d$LifeSpan[i]<30) {
    pch <- c(pch, 1)
  } else {
    pch <- c(pch, 19)
  }
}
plot(d$PopulationPressure, d$InjuredIndividuals/d$BurialJarPots, pch=pch, xlab="Population Pressure", ylab="Proportion of Injured Individuals")
legend("topleft", legend=c("not aggregated", "aggregated"), pch=c(1, 19))
dev.copy2eps(file="figure1.eps", width=8, height=6)
dev.off()
