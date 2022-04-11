
is_binary <- function(var, na.rm = FALSE) {

  if (na.rm == TRUE) {
    var <- var[!is.na(var)]
  }

  two_distinct_values <- length(unique(var)) == 2

  return(two_distinct_values)

}