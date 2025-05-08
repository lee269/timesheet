library(here)
library(unpivotr)
library(tidyxl)
library(dplyr)

source(here("R", "read.R"))

ts <- list.files(here("data"), full.names = TRUE)

data <- ts |> 
  purrr::map(read_ts_workbook) |> 
  # purrr::map(\(x) read_timesheet(xlsx = ts, sheet = x)) |> 
  bind_rows() |> 
  mutate(io = coalesce(credit, note))

data |>  count(io)
