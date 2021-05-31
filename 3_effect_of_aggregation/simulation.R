# a toy model to investigate the possible effects of aggregation.
# set the random seed equal to zero.
set.seed(0)

# we calculated the effect of population pressure using only non-aggregated data points.
d <- read.csv("data.csv")
d.sub <- subset(d, d$LifeSpan<30)
glm <- glm(cbind(d.sub$InjuredIndividuals, d.sub$BurialJarPots-d.sub$InjuredIndividuals)~d.sub$PopulationPressure, family="binomial")
# objects 'intercept' and 'coef' are the parameters of logistic regression
intercept <- summary(glm)$coefficient[1,1]
coef <- summary(glm)$coefficient[2,1]

simulation <- function(intercept, coef) {
  # read the data set
  d <- read.csv("data.csv")

  # the length of subphases are calculated based on the asumption that 25 years are one time unit.
  # therefore, 1: 25 years, 4: 100 years, 3: 70 or 80 years.
  phase.length <- c(1,1,4,3,3,3)
  area <- unique(d$AreaArcGIS)

  # 'result.injured', 'result.n', and 'result.pop.pressure' are objects to add the results of a simulation.
  result.injured <-c()
  result.n <- c()
  result.pop.pressure <- c()

  # simulation for non-aggregated data points
  # we generate 100 artificail samples based on the results of the logistic regression
  for (i in 1:100) {
    # randomly chose one value among the BurialJarPots column (i.e., the proxy of population) in the data set.
    n <- sample(d$BurialJarPots, 1)
    # randomly chose one value among the AreaArcGIS column (i.e., area suitable for cultivation) in the data set.
    area <- sample(d$AreaArcGIS, 1)
    # calculate an artificial value of population pressure
    pop.pressure <- 10*n/25/area
    p <- 1/(1+exp(- (intercept + coef*pop.pressure) ) )
    # calculate an artificial value of the number of injured individuals
    injured <- rbinom(1, n, p)

    result.injured <-c(result.injured, injured)
    result.n <- c(result.n, n)
    result.pop.pressure <- c(result.pop.pressure, pop.pressure)
  }

  # simulation for an aggregated data point.
  for (i in 1:100) {
    sum.n <- 0
    sum.injured <- 0
    area <- sample(d$AreaArcGIS, 1)
    # we assume that one aggregated data point are made by summing four events.
    for (k in 1:4) {
      n <- sample(d$BurialJarPots, 1)
      pop.pressure <- 10*n/25/area
      p <- 1/(1+exp(- (intercept + coef*pop.pressure) ) )
      injured <- rbinom(1, n, p)
      sum.n <- sum.n + n
      sum.injured <- sum.injured + injured
    }

    result.injured <-c(result.injured, sum.injured)
    result.n <- c(result.n, sum.n)
    result.pop.pressure <- c(result.pop.pressure, 10*sum.n/100/area)
  }
  df <- data.frame(injured=result.injured, n=result.n, pressure=result.pop.pressure)
  return(df)
}
