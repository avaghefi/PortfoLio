#' simple functions for data manupulations
#' 
#######################################
# list to dataframe
# turn it to a data frame
lst_to_df <- function(lst){
  df <- do.call(cbind
                ,lst)
  names(df) <- names(lst)
  return(df)
}

