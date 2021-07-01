#!/usr/bin/env -S Rscript --vanilla
#
# Authors:     MG
# Maintainers: MG
# =========================================
# inspection-tools/inspect-json.R

if (!require('pacman', quietly = TRUE)) {install.packages('pacman')}

pacman::p_load(argparse, rjson, dplyr, glue, tibble)

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
fromJSON(file = path.expand(args$file)) %>%
    as_tibble() %>%
    head(n = args$n) %>%
    write.table(file = "", sep = "|", quote = FALSE)
cat("\n")

# done.
