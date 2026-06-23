# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-19
# Filename: mmarks9-PDIR-08-analysis-table1scale.R

# Purpose of this script: Find mean/SD/range of multi item phys distrust scale
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-08-analysis-table1scale"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
gss <- readRDS(file= "mmarks9-PDIR-07-mgmt-scale.RDS")

##1 Finding descriptive statistics ---------------------------------------------
avg.scale <-mean(gss$scalephys)
rg.scale <- range(gss$scalephys)
sd.scale <- sd(gss$scalephys)



# close log
sink()
