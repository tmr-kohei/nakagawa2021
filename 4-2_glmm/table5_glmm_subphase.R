# generalized linear mixed model with the logit link function.
# subphase is used as a random effect
library("lme4")
library("MuMIn")
d <-read.csv("data.csv")

# independent variable is population pressure
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$PopulationPressure + (1|d$Phase), family = binomial)
print(summary(glmm))
#calculate 95% confidence interval
confidence.interval <- confint.merMod(glmm, method="Wald")
print("95% Confidence Interval")
print(confidence.interval)
# calculate pseudo R^2
R2 <- r.squaredGLMM(glmm)
print(R2)

# independent variable is time length
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$LifeSpan + (1|d$Phase), family = binomial)
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
glmm <- glmer(cbind(d$InjuredIndividuals, d$BurialJarPots-d$InjuredIndividuals)~d$PopulationPressure + d$LifeSpan + d$AreaArcGIS + (1|d$Phase), family = binomial)
print(summary(glmm))
#calculate 95% confidence interval
confidence.interval <- confint.merMod(glmm, method="Wald")
print("95% Confidence Interval")
print(confidence.interval)
# calculate pseudo R^2
R2 <- r.squaredGLMM(glmm)
print(R2)
