# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-14
# Filename: mmarks9-PDIR-03-mgmt-missval.R

# Purpose of this script: Add missing values where necessary
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-03-mgmt-missval"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(dplyr)
gss <- readRDS(file= "mmarks9-PDIR-02-mgmt-revcode.RDS")
#multiple imputation- mice
## Create copies of the variables I need to change -----------------------------
gss$docearn2 <- gss$docearn3
gss$docskls2 <- gss$docskls3
gss$docmstk2 <- gss$docmstk
gss$doctlk2 <- gss$doctlk
gss$doctrst2 <- gss$doctrst
gss$letin2 <- gss$LETIN1
gss$polviews2 <- gss$polviews
gss$health2 <-gss$HEALTH1
gss$instype2 <-gss$instype
gss$wrkstat2 <- gss$wrkstat
gss$age2 <-gss$age
gss$educ2 <-gss$educ
gss$realinc2 <-gss$realinc


## 2 Change Physician values to missing-----------------------------------------
gss2<-  gss |>
#8 = dont know, 9 = no answer
  mutate(docearn3 = ifelse(docearn3 == 8, NA, docearn3)) |>
  mutate(docskls3 = ifelse(docskls3 == 8, NA, docskls3)) |>
  mutate(doctlk2 = ifelse(doctlk2 == 8, NA, doctlk2)) |>
  mutate(docmstk2 = ifelse(docmstk2 == 8, NA, docmstk2)) |>
  mutate(doctrst2 = ifelse(doctrst2 == 8, NA, doctrst2)) |>
  mutate(docearn3 = ifelse(docearn3 == 9, NA, docearn3)) |>
  mutate(docskls3 = ifelse(docskls3 == 9, NA, docskls3)) |>
  mutate(doctlk2 = ifelse(doctlk2 == 9, NA, doctlk2)) |>
  mutate(docmstk2 = ifelse(docmstk2 == 9, NA, docmstk2)) |>
  mutate(doctrst2 = ifelse(doctrst2 == 9, NA, doctrst2))
 

## 3 Change immigration answers to missing -------------------------------------
gss3 <-  gss2 |>
#8 = cant choose, 9 = no answer
  mutate(letin2 = ifelse(letin2 == 8, NA, letin2)) |>
  mutate(letin2 = ifelse(letin2 == 9, NA, letin2))

## 4 Change confounding variable answers to missing ---------------------------- 
gss4<- gss3 |>
#8= dont know, 9 = no answer
  mutate(polviews2 = ifelse(polviews2 ==8, NA, polviews2))|>
  mutate(polviews2 = ifelse(polviews2 ==9, NA, polviews2))|>
  mutate(health2 = ifelse(health2 ==9, NA, health2))|>
  mutate(health2 = ifelse(health2 ==8, NA, health2))|>
#98 = dont know, 99= no answer
  mutate(instype2 = ifelse(instype2 ==99, NA, instype2))|>
  mutate(instype2 = ifelse(instype2 ==98, NA, instype2))|>
#8= Other, 9 = no answer
  mutate(wrkstat2 = ifelse(wrkstat2 ==8, NA, wrkstat2))|>
  mutate(wrkstat2 = ifelse(wrkstat2 ==9, NA, wrkstat2))

## 4 Other var not mentioned to missing ----------------------------------------
gss5<- gss4 |>
  mutate(age2 = ifelse(age2 ==99, NA, age2))|>
  mutate(educ2 = ifelse(educ2 ==98, NA, educ2)) |>
  mutate(realinc2= ifelse(realinc2 == 0.0, NA, realinc2))

## 5 Checking ------------------------------------------------------------------
sum_gss5 <- summary(gss5)

## 4 Save as RDS ---------------------------------------------------------------
saveRDS(gss5, "mmarks9-PDIR-03-mgmt-missval.RDS")

# close log
sink()

