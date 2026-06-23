# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-14
# Filename: mmarks9-PDIR-06-mgmt-impute.R

# Purpose of this script: Impute missing values
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-06-mgmt-impute"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(mice)
library(dplyr)
gss <- readRDS(file= "mmarks9-PDIR-04-mgmt-table1var.RDS")

##1 Reduce dataset to only new variables ---------------------------------------
gss_small <- select(gss, docearn3, docskls3, docmstk2, doctlk2, doctrst2, 
                    letin2, polviews2, health2, instype2, wrkstat2, age2, educ2,
                    race, born, sex2, realinc3)

## 2 Impute missing data -------------------------------------------------------
set.seed(25)
imp.gss <- mice(gss_small, m = 1, seed = 25, method="pmm", maxit = 10) 
  #taken from "Handling Missing Data in R with MICE" by Stef van Buren
gss.complete <- complete(imp.gss)


## 3 Checking-------------------------------------------------------------------
impdata <- sum(is.na(gss.complete))
ogdata<- sum(is.na(gss))

table(gss$letin2, useNA="ifany")
table(gss.complete$letin2, useNA="ifany")

mean(gss.complete$realinc)

##Saving RDS dataset -----------------------------------------------------------
saveRDS(gss.complete, "mmarks9-PDIR-06-mgmt-impute.RDS")

# close log
sink()
