#!/usr/bin/env Rscript --vanilla
#
# Authors:     MG
# Maintainers: MG
# Copyright:   2020, HRDAG, GPL v2 or later
# =========================================
# inspection-tools/inspect-excel.R

if (!require('pacman', quietly = TRUE)) {install.packages('pacman')}

pacman::p_load(argparse, readxl, dplyr, readr, glue)

parser <- ArgumentParser()
parser$add_argument("--file")
parser$add_argument("--show_sheets", action = "store_true", default = FALSE)
parser$add_argument("--tocsv", action = "store_true", default = FALSE)
parser$add_argument("--n", type = "integer", default = 10)
parser$add_argument("--skip", type = "integer", default = 0)

args <- parser$parse_args()

if (args$show_sheets) {
  print(glue("the sheets in the file {args$file} are:"))
  print(glue("{excel_sheets(path.expand(args$file))}"))
  cat("\n")
}

if (args$tocsv) {
  print(glue("showing first {args$n} rows"))
  read_excel(args$file,
             guess_max = 1000000,
             skip = args$skip) %>%
    head(n = args$n) %>%
    write.table(file = "", sep = "|", quote = FALSE)
  cat("\n")
}