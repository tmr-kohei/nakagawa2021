d <-read.csv("data.csv")

# logistic regression
glm <- glm(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$PopulationPressure, family="binomial")
print(summary(glm))

# calculate odds ratio
odds.ratio <- exp(glm$coefficients[[2]])
print("Odds Ratio")
print(odds.ratio)

#calculate 95% confidence interval
confidence.interval <- c(exp(confint(glm))[2], exp(confint(glm))[4])
print("95% Confidence Interval")
print(confidence.interval)

# we set the range of population pressure from 0 to 3.2
x <- c(0:320)/100
intercept <- summary(glm)$coefficient[1,1]
coef <- summary(glm)$coefficient[2,1]
# calculate the model prediction
prob <- 1/(1+exp(- (intercept + coef*x) ) )
pch <- c(rep(4,6), rep(15,6), rep(19,6), rep(3,6), rep(17,6), rep(18,6))
col <- c(rep("green",6), rep("blue", 6), rep("orange", 6), rep("red", 6), rep("#bdb76b", 6), rep("red", 6))
# plot the model prediction
plot(x, prob, xlim=c(0,3.5), ylim=c(0,0.016), type="l", xlab="Population pressure", ylab="Frequency of violence")
par(new=T)
# plot the upper bound of the 95% CI
prob.upper <- 1/(1+exp(- (intercept + confint(glm)[2,2]*x) ) )
plot(x, prob.upper, xlim=c(0,3.5), ylim=c(0,0.016), type="l", lty=2, xlab="Population pressure", ylab="Frequency of violence")
par(new=T)
# plot the lower bound of the 95% CI
prob.lower <- 1/(1+exp(- (intercept + confint(glm)[2,1]*x) ) )
plot(x, prob.lower, xlim=c(0,3.5), ylim=c(0,0.016), type="l", lty=2, xlab="Population pressure", ylab="Frequency of violence")
par(new=T)
# plot the data
plot(d$PopulationPressure, d$InjuredIndividuals/d$BurialJarPots, , xlim=c(0,3.5), ylim=c(0,0.016), xlab="", ylab="", pch=pch, col=col, cex=1.5)
# the names of subphases are described below the points
text(d$PopulationPressure, d$InjuredIndividuals/d$BurialJarPots, d$Phase, cex=1, pos=1, col="black")
legend("topright", legend=unique(d$Area), pch=c(4, 15, 19, 3, 17, 18), col=c("green", "blue", "orange", "red", "#bdb76b", "red"))
dev.copy2eps(file="figure5.eps")
dev.off()
