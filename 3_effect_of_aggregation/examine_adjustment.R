# to investigate the effects to adjust the different levels of aggregation.
source("simulation.R")
set.seed(0)

d <- read.csv("data.csv")
phase.length <- c(1,1,4,3,3,3)
area <- unique(d$AreaArcGIS)
# we calculated the effect of population pressure using only non-aggregated data points.
d.sub <- subset(d, d$LifeSpan<30)
# calculate the frequency of violence based on the results of the logistic regression
glm <- glm(cbind(d.sub$InjuredIndividuals, d.sub$BurialJarPots-d.sub$InjuredIndividuals)~d.sub$PopulationPressure, family="binomial")
intercept <- summary(glm)$coefficient[1,1]
coef <- summary(glm)$coefficient[2,1]

# in the following simulation, we estimated the effects of population pressure in two different ways.
# 'result.coef1' and 'result.coef2' are objects to add the results.
result.coef1 <- c()
result.coef2 <- c()

# we carry out 1000 simulation runs
for (i in 1:1000) {

  df <- simulation(intercept, coef)

  # parameters are estimated without the adjustment
  glm1 <- glm(cbind(df$injured, df$n-df$injured)~df$pressure, family="binomial")
  coef1 <- summary(glm1)$coefficient[2,1]

  # parameters are estimated with the adjustment
  glm2 <- glm(cbind(df$injured, df$n-df$injured)~df$pressure + c(rep(25,100), rep(100,100)), family="binomial")
  coef2 <- summary(glm2)$coefficient[2,1]

  result.coef1 <- c(result.coef1, coef1)
  result.coef2 <- c(result.coef2, coef2)
}
# show the proportion of cases where the parameter with adjustment is closer to the actual parameter than that without the adjustment.
t <- table( abs(result.coef2-coef) < abs(result.coef1-coef) )
print(t)
