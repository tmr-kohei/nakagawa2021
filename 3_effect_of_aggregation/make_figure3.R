# make figure 3 in SI.
source("simulation.R")

# set the random seed equal to zero.
set.seed(0)
par(mfrow=c(3,2))

# we carry out six simulation runs
for (i in 1:6) {

  x <- c(0:500)/100
  # calculate the frequency of violence based on the results of the logistic regression
  p <- 1/(1+exp(- (intercept + coef*x) ) )
  # plot the model prediction
  plot(x, p, xlim=c(0,5), ylim=c(0,0.06), xlab="Population Pressure", ylab="Prop. of Injured Individuals", type="l")
  df <- simulation(intercept, coef)
  par(new=T)
  plot(df$pressure, df$injured/df$n, xlim=c(0,5), ylim=c(0,0.06), xlab="Population Pressure", ylab="Prop. of Injured Individuals", pch=c(rep(1,100), rep(19,100)))
  legend("topleft", legend=c("not aggregated", "aggregated"), pch=c(1, 19))
}
dev.copy2eps(file="figure3.eps")
dev.off()
