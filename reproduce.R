#!/usr/bin/env Rscript
# reproduce.R - driver script to install required packages and run the analysis pipeline

required_pkgs <- c("dplyr", "mice", "ordinal")

install_if_missing <- function(pkgs) {
  installed <- rownames(installed.packages())
  to_install <- pkgs[!(pkgs %in% installed)]
  if (length(to_install) > 0) {
    message("Installing missing packages: ", paste(to_install, collapse = ", "))
    install.packages(to_install, repos = "https://cloud.r-project.org")
  } else {
    message("All required packages are already installed.")
  }
}

run_script <- function(script) {
  if (!file.exists(script)) stop(sprintf("Script not found: %s", script))
  message(sprintf("\n----- Running %s -----", script))
  status <- system2("Rscript", args = c(script))
  if (status != 0) stop(sprintf("Script failed (exit %d): %s", status, script))
}

main <- function() {
  message("Checking and installing required packages...")
  install_if_missing(required_pkgs)

  # Check for GSS data file (not included in repo)
  if (!file.exists("gss2012.RDS")) {
    stop("Required data file 'gss2012.RDS' not found in repository root.\nPlease download the GSS 2012 data as described in README.md and place it at the repository root with the filename 'gss2012.RDS'.")
  }

  # Ordered list of scripts to run (matches README pipeline)
  scripts <- c(
    "code/mmarks9-PDIR-01-mgmt-setup.R",
    "code/mmarks9-PDIR-02-mgmt-revcode.R",
    "code/mmarks9-PDIR-03-mgmt-missval.R",
    "code/mmarks9-PDIR-04-mgmt-table1var.R",
    "code/mmarks9-PDIR-05-analysis-desc.R",
    "code/mmarks9-PDIR-06-mgmt-impute.R",
    "code/mmarks9-PDIR-07-mgmt-scale.R",
    "code/mmarks9-PDIR-08-analysis-table1scale.R",
    "code/mmarks9-PDIR-09-analysis-OLSreg.R",
    "code/mmarks9-PDIR-10-analysis-OLRreg.R"
  )

  # Run each script sequentially, stopping on failure
  for (s in scripts) {
    run_script(s)
  }

  message("\nReproduction complete. Check .log files and generated RDS outputs in the repository root and code/ directory.")
}

# Run main and provide a helpful error message on failure
tryCatch(
  main(),
  error = function(e) {
    message('\nERROR: ', e$message)
    quit(status = 1)
  }
)
