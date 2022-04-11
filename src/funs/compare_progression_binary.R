compare_progression_binary <- function(data,
                                       group,
                                       var,  # numeric variable to be compared AS STRING
                                       verbose = TRUE){

  require(glue)
  require(tidyverse)
  require(ggstatsplot)
  require(rstatix)
  require(gt)
  require(broom)

  flog.appender(appender.file("covid-icu.log"))
  flog.info("STARTING `compare_progression binary`")

 # var <- as.name(var)

  dv <- deparse(substitute(var))  # get dependent variable as string
  iv <- deparse(substitute(group))



  var_is_binary <- length(unique(data[[dv]]))


  cat(paste0("## ", dv, "\n"))
  cat("\n")

  cat(paste0("Starting analysis for variable: **", dv, "**\n"))
  cat("\n")
  cat(paste0("Grouping variable: ", iv, "\n"))
  cat("\n")

  ## descriptives

  cat("</br>")

  d_summary <-
    data %>%
    select({{var}}, {{group}}) %>%
    drop_na() %>%
    mutate({{group}} := as.factor({{group}})) %>%
    group_by({{group}}) %>%
    summarise({{var}} := n())

  gt::gt(d_summary)




  cat("\n")
  cat("\n")
  cat("### Visualizing differences between the two binary groups:\n")
  cat("\n")
  cat("\n")


  ggstatsplot::ggpiestats(data = data,
                              y = {{var}},
                              x = {{group}}) %>%
    plot()



  cat("\n")
  cat("\n")

  cat("</br>")

  cat(paste0("End of analysis for variable: **", dv, "** \n"))
  cat("\n")



  cat("\n")
  cat("\n")




}



