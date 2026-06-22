# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-14
# Filename: mmarks9-PDIR-02-mgmt-revcode.R

# Purpose of this script: Reverse code docskls and docearn
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-02-mgmt-revcode"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(dplyr)
gss <- readRDS(file= "mmarks9-PDIR-01-mgmt-setup.RDS")

##1 Reverse code docearn2 ------------------------------------------------------
gss$docearn3 <- gss$docearn
gss2<- gss |>
  mutate(docearn3 = ifelse(docearn3 ==5, 6, docearn3))|>
  mutate(docearn3 = ifelse(docearn3 ==1, 5, docearn3))|>
  mutate(docearn3 = ifelse(docearn3 ==6, 1, docearn3))|>
  mutate(docearn3 = ifelse(docearn3 ==2, 6, docearn3))|>
  mutate(docearn3 = ifelse(docearn3 ==4, 2, docearn3))|>
  mutate(docearn3 = ifelse(docearn3 ==6, 4, docearn3))

table(gss2$docearn, gss2$docearn3, deparse.level = 2)


## 2 Reverse code docskls2  ----------------------------------------------------
gss2$docskls3 <- gss2$docskls
gss3<- gss2 |>
  mutate(docskls3 = ifelse(docskls3 ==5, 6, docskls3))|>
  mutate(docskls3 = ifelse(docskls3 ==1, 5, docskls3))|>
  mutate(docskls3 = ifelse(docskls3 ==6, 1, docskls3))|>
  mutate(docskls3 = ifelse(docskls3 ==2, 6, docskls3))|>
  mutate(docskls3 = ifelse(docskls3 ==4, 2, docskls3))|>
  mutate(docskls3 = ifelse(docskls3 ==6, 4, docskls3))

table(gss3$docskls3, gss3$docskls, deparse.level = 2)



##Saving RDS dataset -----------------------------------------------------------
saveRDS(gss3, "mmarks9-PDIR-02-mgmt-revcode.RDS")

# close log
sink()
