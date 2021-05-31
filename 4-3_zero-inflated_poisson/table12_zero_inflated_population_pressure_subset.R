# zero-inflated Poisson model
# the probability of the occurence of violence is assumed to depend on population pressure
# the offset term is used to adjust the difference in (the proxy of) population size.
library("pscl")

d <-read.csv("data.csv")
# only aggregated data points are used.
d <- subset(d, d$LifeSpan>30)

# independent variable is population pressure
zip <- zeroinfl(d$InjuredIndividuals ~ d$PopulationPressure + offset(log(d$BurialJarPots))  | d$PopulationPressure )
print(summary(zip))
# calculate 95% CI
confidence.interval <- confint(zip)
print(confidence.interval)
# calculate pseudo R^2
R2 <- pR2(zip)
print(R2)
# calculate AIC value
AIC <- AIC(zip)
print("AIC")
print(AIC)

# independent variable is area suitable for cultivation
zip <- zeroinfl(d$InjuredIndividuals ~ d$AreaArcGIS + offset(log(d$BurialJarPots))  | d$PopulationPressure )
print(summary(zip))
# calculate 95% CI
confidence.interval <- confint(zip)
print(confidence.interval)
# calculate pseudo R^2
R2 <- pR2(zip)
print(R2)
# calculate AIC value
AIC <- AIC(zip)
print("AIC")
print(AIC)

# full model
zip <- zeroinfl(d$InjuredIndividuals ~ d$PopulationPressure + d$AreaArcGIS + offset(log(d$BurialJarPots))  | d$PopulationPressure )
print(summary(zip))
# calculate 95% CI
confidence.interval <- confint(zip)
print(confidence.interval)
# calculate pseudo R^2
R2 <- pR2(zip)
print(R2)
# calculate AIC value
AIC <- AIC(zip)
print("AIC")
print(AIC)
