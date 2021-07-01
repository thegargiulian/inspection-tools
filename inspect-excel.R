#!/usr/bin/env -S Rscript --vanilla
#
# Authors:     MG
# Maintainers: MG
# =========================================
# inspection-tools/inspect-excel.R

if (!require('pacman', quietly = TRUE)) {install.packages('pacman')}

pacman::p_load(argparse, readxl, dplyr, readr, glue)

parser <- ArgumentParser()
parser$add_argument("file",
                    nargs = 1,
                    help = "the path of to the file to inspect.")
parser$add_argument("--show_sheets",
                    action = "store_true", default = FALSE,
                    help = "show the names of the sheets in the file (no flag defaults to FALSE).")
parser$add_argument("--tocsv",
                    action = "store_true", default = FALSE,
                    help = "display the specified contents of the file delimited by |. (no flag defaults to FALSE).")
parser$add_argument("--sheet",
                    default = 1,
                    help = "sheet to read in. accepts the sheet name or its position (default: 1).")
parser$add_argument("--skip",
                    type = "integer", default = 0,
                    help = "number of rows to skip (default: 0).")
parser$add_argument("--n",
                    type = "integer", default = 10,
                    help = "number of rows to display.")

args <- parser$parse_args()

if (args$show_sheets) {

  cat("\n")
  print(glue("the sheets in the file {args$file} are:"))
  print(glue("{excel_sheets(path.expand(args$file))}"))
  cat("\n")

}

if (args$tocsv) {

  if (!is.na(suppressWarnings(as.integer(args$sheet)))) {
    sheet_name <- as.numeric(args$sheet)
  } else {
    sheet_name <- args$sheet
  }

  cat("\n")
  print(glue("showing {args$n} rows from sheet {sheet_name} after skipping {args$skip}"))
  cat("\n")
  read_excel(path.expand(args$file),
             skip = args$skip,
             sheet = sheet_name,
             col_types = "text") %>%  # guess as char to avoid potential errors related to setting `guess_max`
    head(n = args$n) %>%
    write.table(file = "", sep = "|", quote = FALSE)
  cat("\n")

}

# done.
