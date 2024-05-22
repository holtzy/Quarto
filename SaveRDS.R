library(tidyverse)
library(readxl)

df <- read_xlsx("Data/rower.xlsx")

df

df <- df |>
  complete(Date = seq.Date(
    from =
      min(as.Date(Date)), to = max(as.Date(Date)), by = "day"
  )) |>
  mutate(Index = row_number(),
    KilometersHour = (Distance/Duration)*60,
    across(2:5, ~ifelse(is.na(.), 0, .)),
         Date = as.Date(Date)
    )

saveRDS(file = "Biking.rds", object = df)

names(df)
