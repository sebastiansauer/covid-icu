

sum_isna <- function(x) {
  sum(is.na(x))
}



my_chisq <- function(d, col){
  out <- infer::chisq_test(response = verlauf,
                           explanatory = {{col}},
                           x = d)
  return(out)
}


my_chisq2 <- function(d, x, y = verlauf){

  tab_data <- table(d[[x]], d[[y]])

  chi_res <- stats::chisq.test(tab_data)
  return(chi_res)
}



my_chisq3  <- function(d, x, y = verlauf){

  tab_data <- table(d[[x]], d[[y]])

  chi_res <- stats::chisq.test(tab_data)

  chi_res_tidy <- broom::tidy(chi_res)

  chi_res_tidy2 <-
    chi_res_tidy %>%
    mutate(chi_count = sum(chi_res$observed),
           chi_nrow = nrow(chi_res$observed),
           chi_ncol = ncol(chi_res$observed))

  return(chi_res_tidy2)
}
