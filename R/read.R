
read_timesheet <- function(xlsx, sheet) {
  
  cells <- tidyxl::xlsx_cells(path = xlsx, sheets = sheet)
  
  data <- cells |> 
    dplyr::filter(row >=11, col %in% c(2,3,17, 19,20,24)) |> 
    unpivotr::behead("left", name = "weekday") |> 
    unpivotr::behead("left", name = "date") |> 
    unpivotr::behead("left", name = "credit") |> 
    unpivotr::behead("left", name = "hr") |> 
    unpivotr::behead("left", name = "min") |> 
    dplyr::select(sheet, weekday, date = date.header, credit, hr, min, note = character) |> 
    dplyr::filter(!is.na(date))
  
  return(data)

}

