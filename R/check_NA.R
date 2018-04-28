#' The test of NAs in the data frame.
#' 
#' Sample data to test the package and its functions, is also provided.
#' This test will check every column in a data.frame for 'NAs'.
#' In either case (NA exists or not), a message will be printed.
#' 
#' @param dat input dataset. Currently only supports \code{data.frame}. While, \code{data.table} is not supported.
#' @export

#Start of function
check_NA <- function(dat){
  
  # check for NAs in all columns
  NA_det[] <- apply(dat, 2, function(x) any(is.na(x)))
  
  if ("TRUE" %in% NA_det[]){
    msg <- "NA exists"
  } else{
    msg <- "NA does not exist"}
  
return(msg)
}
#End of function