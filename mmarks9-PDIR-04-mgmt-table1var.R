# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-13
# Filename: mmarks9-PDIR-04-mgmt-table1var.R

# Purpose of this script: Edit some of the variables needed for Table 1
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-04-mgmt-table1var"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(dplyr)
gss <- readRDS(file= "mmarks9-PDIR-03-mgmt-missval.RDS")

## Make sex variable binary  ---------------------------------------------------

gss$sex2 <- gss$sex
gss2<-gss |>
  mutate(sex2 = ifelse(sex2 == 2, 1, 0))

## 2 Income variable- more missing ---------------------------------------------

gss2$realinc3 <- gss2$realinc2
gss3 <- gss2 |>
  mutate(realinc3 = ifelse(realinc3 == 980.0, NA, realinc3)) |>
  mutate(realinc3 = ifelse(realinc3 == 1715.0, NA, realinc3))


## 4 Save as RDS ---------------------------------------------------------------
saveRDS(gss3, "mmarks9-PDIR-04-mgmt-table1var.RDS")

# close log
sink()