library(rmarkdown)


# rmdfile 01 --------------------------------------------------------------



rmdfile01_w_path <- here::here("src", "reports", paste0(rmdfile01, ".Rmd"))
stopifnot(file.exists(rmdfile01_w_path))

render(input = rmdfile01_w_path,
       output_file = here::here("docs", paste0(rmdfile01, ".html")))



# rmdfile 02 --------------------------------------------------------------


rmdfile02_w_path <- here::here("src", "reports", paste0(rmdfile02, ".Rmd"))
stopifnot(file.exists(rmdfile02_w_path))

render(input = rmdfile02_w_path,
       output_file = here::here("docs", paste0(rmdfile02, ".html")))



# rmdfile 03 --------------------------------------------------------------


rmdfile03_w_path <- here::here("src", "reports", paste0(rmdfile03, ".Rmd"))
stopifnot(file.exists(rmdfile03_w_path))

render(input = rmdfile03_w_path,
       output_file = here::here("docs", paste0(rmdfile03, ".html")))



