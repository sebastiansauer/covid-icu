

prop_NA <- function(df, threshold = .1) {
  # Shows NA prop for all variables of `df` exceeding `threshold`

  df %>%
    summarise(across(everything(), sum_isna)) %>%
    pivot_longer(everything()) %>%
    mutate(prop = value/nrow(df)) %>%
    arrange(-prop) %>%
    filter(prop > threshold)
}
