# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-19
# Filename: mmarks9-PDIR-07-mgmt-scale.R

# Purpose of this script: Create multiple item physician distrust scale
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-07-mgmt-scale"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
gss <- readRDS(file= "mmarks9-PDIR-06-mgmt-impute.RDS")

## 1 Standardizing variables in scale-------------------------------------------
gss$doctrsts<- (gss$doctrst2 - mean(gss$doctrst2))/sd(gss$doctrst2)
gss$docsklss<- (gss$docskls3 - mean(gss$docskls3))/sd(gss$docskls3)
gss$docearns<- (gss$docearn3 - mean(gss$docearn3))/sd(gss$docearn3)
gss$docmstks<- (gss$docmstk2 - mean(gss$docmstk2))/sd(gss$docmstk2)
gss$doctlks<- (gss$doctlk2 - mean(gss$doctlk2))/sd(gss$doctlk2)

##2 Create multi item phys distrust variable -----------------------------------
gss$scalephys <- rowMeans(
  gss[, c("doctrsts", "docsklss", "docmstks", "docearns", "doctlks")],
  na.rm = FALSE
)


##Saving RDS dataset -----------------------------------------------------------
saveRDS(gss, "mmarks9-PDIR-07-mgmt-scale.RDS")

# close log
sink()
