# generalized linear mixed model with the logit link function.
# subphase is used as a random effect
library("lme4")
library("MuMIn")
d <-read.csv("data.csv")
# only aggregated data points are used
d <- subset(d, d$LifeSpan>30)

# logistic regression
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$PopulationPressure + (1|d$Phase), family = binomial)
print(summary(glmm))
#calculate 95% confidence interval
confidence.interval <- confint.merMod(glmm, method="Wald")
print("95% Confidence Interval")
print(confidence.interval)
# calculate pseudo R^2
R2 <- r.squaredGLMM(glmm)
print(R2)

# independent variable is area
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$AreaArcGIS + (1|d$Phase), family = binomial)
print(summary(glmm))
#calculate 95% confidence interval
confidence.interval <- confint.merMod(glmm, method="Wald")
print("95% Confidence Interval")
print(confidence.interval)
# calculate pseudo R^2
R2 <- r.squaredGLMM(glmm)
print(R2)

# full model
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$PopulationPressure + d$AreaArcGIS + (1|d$Phase), family = binomial)
print(summary(glmm))
#calculate 95% confidence interval
confidence.interval <- confint.merMod(glmm, method="Wald")
print("95% Confidence Interval")
print(confidence.interval)
# calculate pseudo R^2
R2 <- r.squaredGLMM(glmm)
print(R2)
