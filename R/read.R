library(here)
library(unpivotr)
library(tidyxl)
library(dplyr)

ts <- here("data", "2024-01-hours.xlsx")

sheets <- tidyxl::xlsx_sheet_names(ts)

cells <- xlsx_cells(path = ts, sheets = "02-Dec-24")

data <- cells |> 
  filter(row >=11, col %in% c(2,3,17, 19,20,24)) |> 
  behead("left", name = "weekday") |> 
  behead("left", name = "date") |> 
  behead("left", name = "credit") |> 
  behead("left", name = "hr") |> 
  behead("left", name = "min") |> 
  select(sheet, weekday, date = date.header, credit, hr, min, note = character) |> 
  filter(!is.na(date))

data |> filter(is.na(credit)) |> count(note)
