library(rmarkdown)

source(here("src", "01-constants.R"))


render_report <- function(this_report, path = path_prefix_docs) {

  this_report_w_path <- here::here("src", "reports", paste0(this_report, ".Rmd"))
  stopifnot(file.exists(this_report_w_path))

  output_path <- here::here("docs", paste0(this_report, ".html"))

  render(input = this_report_w_path,
         output_file = output_path)

}


# rmdfile 01 --------------------------------------------------------------


debug(render_report)
render_report(rmdfile01)


# rmdfile 02 --------------------------------------------------------------



render_report(rmdfile02)


# rmdfile 03 --------------------------------------------------------------



render_report(rmdfile03)

# rmdfile 04 --------------------------------------------------------------


render_report(rmdfile04)
