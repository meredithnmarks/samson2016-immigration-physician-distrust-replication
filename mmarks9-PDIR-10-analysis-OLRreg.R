# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-19
# Filename: mmarks9-PDIR-10-analysis-OLRreg.R

# Purpose of this script: Do OLR regression for Model 4 of Table 2
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-10-analysis-OLRreg"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
gss <- readRDS(file= "mmarks9-PDIR-07-mgmt-scale.RDS")
library(ordinal)
##1 Changing Real Income--------------------------------------------------------
gss$realinc4 <- (gss$realinc3/1000)

##2 Model 4---------------------------------------------------------------------
model4<- clm(as.factor(doctrsts) ~ letin2+age2+educ2+realinc4+sex2+as.factor(race)
              +born+polviews2+ wrkstat2+instype2+health2, data = gss)
summary(model4)

##3 Notes---------------------------------------------------------------------
#this model is somehow different than the studies- could be because of imputation
#or maybe race variable

#study has intercept omitted- did they run w/o intercept
#F statistic would require more coding- Dr. B said dont worry about it
#letin p value 0.0023- should b <0.001
#age p value= 0.13- should be 0.01<x<0.05
#educ p value= 0.0044, should be >0.05
#sex p value= 0.00547, should be >0.05
#black p value=0.000556, should be 0.001<x<0.01
#health significance correct 2 stars
#
# close log
sink()
