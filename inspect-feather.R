#!/usr/bin/env -S Rscript --vanilla
#
# Authors:     MG
# Maintainers: MG
# Copyright:   2020, HRDAG, GPL v2 or later
# =========================================
# inspection-tools/inspect-parquet.R

if (!require('pacman', quietly = TRUE)) {install.packages('pacman')}

pacman::p_load(argparse, arrow, dplyr, readr, glue)

parser <- ArgumentParser()
parser$add_argument("file",
                    nargs = 1,
                    help = "the path of to the file to inspect.")
parser$add_argument("--n",
                    type = "integer", default = 10,
                    help = "number of rows to display.")

args <- parser$parse_args()

cat("\n")
print(glue("showing first {args$n} rows"))
cat("\n")
read_feather(path.expand(args$file)) %>%
    head(n = args$n) %>%
    write.table(file = "", sep = "|", quote = FALSE)
cat("\n")

# done.
