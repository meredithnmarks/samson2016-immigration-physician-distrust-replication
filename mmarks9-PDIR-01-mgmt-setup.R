# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-12
# Filename: mmarks9-PDIR-01-mgmt-setup.R

# Purpose of this script: Load data, select variables, get to sample size
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-01-mgmt-setup"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(dplyr)
gss <- readRDS(file= "gss2012.RDS")

## 1 make sure data is only from 2012 ------------------------------------------
table(gss$year)

## 2 Select the required variables ---------------------------------------------

gss_sel<- select(gss, age, educ, realinc, sex, race, polviews, born,
                 wrkstat,instype, HEALTH1, doctrst, docearn, docskls,
                 docmstk, doctlk, LETIN1)
table(gss_sel$docearn) #checking to make sure the var had values that aren't 0

## 3 Get down to sample size n=1080 --------------------------------------------
mydata<- gss_sel |>
  filter(docearn != 0) |> #0 means respondents were not asked Q 
  filter(LETIN1 != 0)
table(mydata$docearn) #making sure got rid of 0 values

##Saving RDS dataset -----------------------------------------------------------
saveRDS(mydata, "mmarks9-PDIR-01-mgmt-setup.RDS")

# close log
sink()

