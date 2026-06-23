# Makefile for reproducing the analysis

.PHONY: reproduce clean

# Run the R driver which installs packages and runs the pipeline
reproduce:
	Rscript reproduce.R

clean:
	-rm -f *.log *.RDS
	@echo "Removed logs and RDS files (if present)."