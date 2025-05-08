library(here)
library(unpivotr)
library(tidyxl)
library(dplyr)

source(here("R", "read.R"))

ts <- here("data", "2024-01-hours.xlsx")
sheets <- tidyxl::xlsx_sheet_names(ts)
sheets <- sheets[1:length(sheets)-1]

data <- sheets |> 
  purrr::map(\(x) read_timesheet(xlsx = ts, sheet = x)) |> 
  bind_rows()

data |>  count(note)
