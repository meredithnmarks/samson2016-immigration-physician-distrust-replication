# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-19
# Filename: mmarks9-PDIR-09-analysis-OLSreg.R

# Purpose of this script: Do OLS regression for Models 1-3 of Table 2
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-09-analysis-OLSreg"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
gss <- readRDS(file= "mmarks9-PDIR-07-mgmt-scale.RDS")

##1 Model 1---------------------------------------------------------------------
model1<- lm(scalephys ~ letin2, data = gss)
summary(model1)

##2 Model 2---------------------------------------------------------------------
model2<- lm(scalephys ~ letin2+age2+educ2+realinc3+sex2+as.factor(race)+born, data = gss)
summary(model2)

#realinc3 p value 0.050055

##3 Model 3---------------------------------------------------------------------
model3<- lm(scalephys ~ letin2+age2+educ2+realinc3+sex2+as.factor(race)+born+polviews2+
              wrkstat2+instype2+health2, data = gss)
summary(model3)

##4 Notes---------------------------------------------------------------------
#Model 1- looks pretty good, not too far away, correct significance levels
#Model 2- correct significance level on letin, p val for inc .050055 so very close
#Model 3- 1 less star on letin, pval is 0.0012 so very close, correct health sig
# close log
sink()
