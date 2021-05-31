d <- read.csv("data.csv")

# carry out a Chi-squared test
chisq <- chisq.test(d[1:2, 2:3], correct=F)
print(chisq)

# calculate effect size
chi <- chisq$statistic[[1]]
n <- sum(d[1:2, 2:3])
df <- chisq$parameter[[1]]
effect.size <- sqrt( chi/n/df )
print("Effect size")
print(effect.size)
