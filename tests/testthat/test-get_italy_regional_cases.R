test_that("get_italy_regional_cases data source is unchanged and up to date", {
  url <- paste0("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-", format(as.Date(Sys.Date() - 1), "%Y%m%d"), ".csv")
  data <- readr::read_csv(url)
  expected_colnames <- c( "data", "stato", "codice_regione", "denominazione_regione", "lat",
                         "long", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospedalizzati", "isolamento_domiciliare",
                         "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti",
                         "totale_casi", "tamponi", "casi_testati", "note_it", "note_en")
  expect_true(all(expected_colnames %in% colnames(data)))
  expect_true(max(as.Date(data$data), na.rm = TRUE) > Sys.Date() - 7)
})

test_that("get_italy_regional_cases returns the correct column names", {
  expected_colnames <- c("region_level_1", "date", "cases_total", "deaths_total",
                         "tested_total")

  returned_colnames <- colnames(get_italy_regional_cases())

  expect_true(all(returned_colnames %in% expected_colnames))
  expect_true(all(expected_colnames %in% returned_colnames))
})

test_that("get_italy_regional_cases returns correct column types", {
  data <- get_italy_regional_cases()
  expect_is(data, "data.frame")
  expect_is(data$region_level_1, "character")
  expect_is(data$date, "Date")
  expect_is(data$cases_total, "numeric")
  expect_is(data$deaths_total, "numeric")
  expect_is(data$tested_total, "numeric")
})