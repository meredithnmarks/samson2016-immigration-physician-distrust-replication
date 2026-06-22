# Metadata ---------------------------------------------------------------------

# Code written by: Meredith Marks
# Last Update: 2026-01-14
# Filename: mmarks9-PDIR-05-analysis-desc.R

# Purpose of this script: Descriptive statistics for Table 1
# 


# Setup ------------------------------------------------------------------------

rm(list=ls())
options(width = 80)

filename <-"mmarks9-PDIR-05-analysis-desc"

sink(paste(filename, ".log", sep = "")) # create log file to store output

# R version
R.version.string


# Project Code -----------------------------------------------------------------

## 0 Load functions and data ---------------------------------------------------
library(dplyr)
gss <- readRDS(file= "mmarks9-PDIR-04-mgmt-table1var.RDS")

##1  Physician distrust props---------------------------------------------------

phys.dist <- c("docearn", "docskls", "doctrst", "docmstk", "doctlk")


for (var in seq_along(phys.dist)) {
  temp.var <- gss[phys.dist[var]]
  temp.prop <-prop.table(table(temp.var, useNA = "ifany"))
  print(temp.prop)
}


## 2 Age, Edcuation, Income, Sex -----------------------------------------------
#educ2, realinc2, age2, sex2

educ.avg <- mean(gss$educ2, na.rm= TRUE)
inc.avg <- mean(gss$realinc3, na.rm= TRUE)
age.avg <- mean(gss$age2, na.rm= TRUE)
sex.avg <-mean(gss$sex2, na.rm= TRUE)

educ.sd <- sd(gss$educ2, na.rm= TRUE)
inc.sd <- sd(gss$realinc3, na.rm= TRUE)
age.sd <- sd(gss$age2, na.rm= TRUE)

educ.miss <- (sum(is.na(gss$educ2))/1080)*100
inc.miss <- (sum(is.na(gss$realinc3))/1080)*100
age.miss <- (sum(is.na(gss$age2))/1080)*100
#need to change sex to binary

## 3 Race, Conservatism, Health Status, Immigration-----------------------------
#race, polviews, HEALTH1, LETIN1
race.prop <- prop.table(table(gss$race))
conserv.prop <- prop.table(table(gss$polviews))
healthstat.prop <- prop.table(table(gss$HEALTH1))
immigration.prop <- prop.table(table(gss$LETIN1))

race.prop
conserv.prop
healthstat.prop
immigration.prop

## 3 Foreign Born, Unemployed, Health Insurance --------------------------------
#
born.perc <- (sum(gss$born == 2)/1080) * 100
unemp.perc <- (sum(gss$wrkstat2 == 4, na.rm= TRUE)/(1080- sum(is.na(gss$wrkstat2)))) *100
insure.prop <- (sum(gss$instype2 == 1, na.rm= TRUE)/(1080- sum(is.na(gss$instype2)))) *100

unemp.miss <- (sum(is.na(gss$wrkstat2))/1080) * 100
insure.miss <- (sum(is.na(gss$instype2))/1080) *100

##Notes-------------------------------------------------------------------------
#Good
#educ- avg off by .03%, sd off by .04%, missing off by .05%
#docskls- very close, max off by .5%
#docearn- 2/4 are off by like 1%, rest are very close
#doctrst- 3 off by 1.1%, rest close
#docmstk-2 off by 2%, some others off by 1%
#doctlk- 2 off by 1.2%
#conservatism- only conservative is off- 1.3%, max otherwise diff is .4%
#age is close- sd is dead on, avg off by 2 years, missing off by .2%
#unemployed- off by .8%, missing off by .4%
#health status- excellent off by .7%, the rest are very close

#Low Priority
#race- white/other off by 3%, black is off by .2%
#immigration- reduced a lot off by 1.1%, the rest are very close
#inc- avg off by 1.9, missing off by 1.6%, SD off by 1.3 

#High Priority
#born- off by 3.1%
#insure- off by 2.7%, missing off by .1%

# close log
sink()
