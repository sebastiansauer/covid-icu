compare_progression_metric <- function(data,
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
  flog.info("STARTING `compare_progression metric`")

  var <- as.name(var)

  dv <- deparse(substitute(var))  # get dependent variable as string
  iv <- deparse(substitute(group))






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
    summarise({{var}} := mean({{var}}))

  gt::gt(d_summary)

  data2 <-
    data %>%
    select({{var}}, {{group}}) %>%
    drop_na() %>%
    ungroup() %>%
    mutate({{group}} := as.factor({{group}}))

  cat("\n")
  cat("\n")
  cat("### Violin plot\n")
  cat("\n")
  cat("\n")


  plot1 <-
    data2 %>%
    ggplot(aes(x = {{var}}, color = {{group}})) +
    geom_density(alpha = .5,
                 aes(fill = {{group}})) +
    geom_vline(aes(xintercept = {{var}},
                   color = as.factor({{group}})),
               data = d_summary) +
    geom_label(aes(x = {{var}},
                   color = as.factor({{group}}),
                   y = 0,
                   label = round({{var}}, 2)),
               data = d_summary)
  plot(plot1)

  cat("\n")
  cat("\n")
  cat("### Histogram\n")
  cat("\n")
  cat("\n")
  plot2 <-
    data2 %>%
    ggplot(aes(x = {{var}},
               fill = as.factor({{group}}),
               color = as.factor({{group}}))) +
    geom_histogram(alpha = .5)
  plot(plot2)


  cat("\n")
  cat("\n")
  cat("### Table \n")
  cat("\n")
  cat("\n")


  tab1 <-
    data2 %>%
    group_by({{group}}) %>%
    get_summary_stats({{var}}) %>%
    arrange({{group}}) %>%
    gt() %>%
    fmt_number(columns = c(where(is.numeric), -{{group}}),
               decimals = 2)
  print(tab1)



  ### Inference
  cat("\n")
  cat("\n")
  cat("### Inference: t-Test between the two groups:\n")
  cat("\n")
  cat("\n")


  frma <- expr(!!ensym(var) ~ !!ensym(group))
  t_test_result <- t.test(formula = eval(frma),
                          data = data2)

  t_test_result_tidy <-
    t_test_result %>%
    tidy()

  t_test_result_gt <-
    t_test_result_tidy %>%
    gt() %>%
    fmt_number(where(is.numeric), decimals = 2)
  print(t_test_result_gt)
  cat("\n")
  cat("\n")
  cat("### Visualizing differences between the two groups:\n")
  cat("\n")
  cat("\n")


  ggstatsplot::ggbetweenstats(data = data,
                              y = {{var}},
                              x = {{group}},
                              bf.message = FALSE) %>%
    plot()



  cat("\n")
  cat("\n")

  cat("</br>")

  cat(paste0("End of analysis for variable: **", dv, "** \n"))
  cat("\n")

  is_signif <-
    tibble(
      var = dv,
      p_value = t_test_result$p.value,
      stat = "t-test results",
      iv = iv,
      time_stamp = Sys.time()
    )

  if (!exists("numeric_out_df")) {

    numeric_out_df <<- is_signif
  } else {

    numeric_out_df <<-
      numeric_out_df %>%
      bind_rows(is_signif)

  }

  cat("\n")
  cat("\n")




  }



