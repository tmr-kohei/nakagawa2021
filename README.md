# nakagawa2021

Scripts for:
Nakagawa, T., Tamura, K., Yamaguchi, Y., Matsumoto, N., Matsugi, T., Nakao, H. (2021) Population pressure and prehistoric violence in the Yayoi period of Japan. Journal of Archaeological Science.

The number in the name of a directory corresponds to the section number of the supplementary material.

## 1_chi_squared
- chisq.R: a script to calculate the chi-squared test. The results of the chi-squared test and the effect size (Cramer’s V) are shown.

## 3_effect_of_aggregation
- simulation.R: a simulation model to investigate possible effects of aggregation.
- examine_adjustment.R: a script to compare the results of the logistic regression with and without the adjustment.
- plot_figure1.R: a script to make figure 1 in SI.
- plot_figure2.R: a script to make figure 2 in SI.
- make_figure3.R: a script yo make figure 3 in SI.

## 4-1_logistic_regression
- logistic_regression.R: a script to carry out the logistic regression.
- make_figure5.R: a script to make figure 5 in the main text.

## 4-2_glmm
- table3_glmm_subregion.R: a script to carry out the GLMM where subregion is used as a random effect.
- table4_glmm_subset_subregion.R: a script to carry out the GLMM where subregion is used as a random effect. Only data points with longer time intarvals (70, 80, and 100 years) are used.
- table5_glmm_subphase.R: a script to carry out the GLMM where subphase is used as a random effect.
- table6_glmm_subset_subphase.R: a script to carry out the GLMM where subphase is used as a random effect. Only data points with longer time intarvals (70, 80, and 100 years) are used.
- table7_glmm_ID.R: a script to carry out the GLMM where ID is used as a random effect.
- table8_glmm_subset_ID.R: a script to carry out the GLMM where ID is used as a random effect. Only data points with longer time intarvals (70, 80, and 100 years) are used.
