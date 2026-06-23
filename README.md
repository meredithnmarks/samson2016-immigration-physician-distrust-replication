
````markdown
# Replication of Samson (2016)

This repository contains the code, documentation, and final report for a replication of Samson (2016), "Support for Immigration Reduction and Physician Distrust in the United States."
The project reproduces the original analyses using data from the 2012 General Social Survey (GSS).

## Repository Structure

- `code/` – R scripts used for data preparation, imputation, scale construction, and regression analyses
- `replication_report.pdf` – Final replication report
- `replication_tables.pdf` – Replication tables
- `project_diary.pdf` – Documentation of the replication process
- `Samson2016_originalpaper.pdf` – Original article being replicated

## Software Requirements

- RStudio version 4.4.2
- Required packages:
  - `dplyr`
  - `mice`
  - `ordinal`

## Reproducing the Analysis

### 1. Download the Data

Download the General Social Survey 2012 data and place it in a folder on your computer.
Set this folder as your working directory in R.

Due to data licensing and repository size considerations, the gss2012.RDS file is not included in this repository.
Users should obtain the dataset separately and place it in the project directory before running the scripts.

### 2. Download the Scripts
All R scripts are located in the `code/` folder.
Download all script files into the same folder as the gss2012.RDS file.

1. `mmarks9-PDIR-01-mgmt-setup`
2. `mmarks9-PDIR-02-mgmt-revcode`
3. `mmarks9-PDIR-03-mgmt-missval`
4. `mmarks9-PDIR-04-mgmt-table1var`
5. `mmarks9-PDIR-05-analysis-desc`
6. `mmarks9-PDIR-06-mgmt-impute`
7. `mmarks9-PDIR-07-mgmt-scale`
8. `mmarks9-PDIR-08-analysis-table1scale`
9. `mmarks9-PDIR-09-analysis-OLSreg`
10. `mmarks9-PDIR-10-analysis-OLRreg`

### 3. Install Required Packages

install.packages(c("dplyr", "mice", "ordinal"))

### 4. Run the Scripts
 Run the scripts in the order listed above
