



prepare_data <- function(data_raw_path, dv = NULL, id = NULL){

  # this function prepars the raw, unprocessed data
  # Arguments:
  # data raw file: (string) path to raw data file (CSV)
  # dv: (string) dependent variable, will be moved to second column position, if not NULL

  require(pacman)
  p_load(tidyverse, here, rio, janitor, futile.logger)


  flog.appender(appender.file("covid-icu.log"))
  flog.threshold(INFO)
  flog.info("STARTING data preparating")
  flog.info("Loaded libs")



  df <- import(data_raw_path)

  df2 <- clean_names(df)
  flog.info("Cleaned names")

  df3 <-
    df2 %>%
    remove_empty(which = c("rows", "cols"))
  flog.info("Removed empty rows and cols")

  df4 <-
    df3 %>%
    mutate(across(where(is.character),
                  parse_number))
  flog.info("Replaced all strings by numbers. Please check whether this makes sense.")

  if (!is.null(dv)) {
  # move dependent variable to the front:
  df4 <-
    df4 %>%
    relocate(.data[[dv]], .after = 1)
  }

  if (!is.null(id)) {
    # rename id column to "id"
    id_var <- tolower(id)
    df4 <-
      df4 %>%
      rename(id = .data[[id_var]])
  }

  out <- df4

  return(out)

}
