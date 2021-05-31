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
