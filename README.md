# Command line tools in R for easier file inspection

## `inspect-excel` - for inspecting `.xlsx` and `.xls` files

```
usage: ./inspect-excel.R [-h] [--show_sheets] [--tocsv] [--sheet SHEET]
                         [--skip SKIP] [--n N]
                         file

positional arguments:
  file           the path of to the file to inspect.

optional arguments:
  -h, --help     show this help message and exit
  --show_sheets  show the names of the sheets in the file (default: FALSE).
  --tocsv        display the specified contents of the file delimited by |.
                 (default: FALSE).
  --sheet SHEET  sheet to read in. accepts the sheet name or its position
                 (default: 1).
  --skip SKIP    number of rows to skip (default: 0).
  --n N          number of rows to display.
```

## `inspect-parquet` - for inspecting `.parquet` files

```
usage: ./inspect-parquet.R [-h] [--n N] file

positional arguments:
  file        the path of to the file to inspect.

optional arguments:
  -h, --help  show this help message and exit
  --n N       number of rows to display.
```

## `inspect-feather` - for inspecting `.feather` files

```
usage: ./inspect-feather.R [-h] [--n N] file

positional arguments:
  file        the path of to the file to inspect.

optional arguments:
  -h, --help  show this help message and exit
  --n N       number of rows to display.
```
