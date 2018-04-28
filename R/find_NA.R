#' Function to locate instances of NAs (row and column) in sample df
#' Just for fun ;)
#' 
#' Sample data to test the package and its functions, is also provided
#' 
#' @param dat input dataset. Currently only supports \code{data.frame}. While, \code{data.table} is not supported.
#' @export

# Start of function
find_NA <- function(dat){
  
  #check if dataset is "data.frame"
  if (!is(dat, "data.frame")) {
    stop("This function only tests data.frames in the moment")
  }
  message(sprintf("Checking %s columns...", ncol(dat)))
  # apply(dat, 2, function(x) any(is.na(x)))
  
  # the possible instances of NAs in df
  NA_aliases = list(
    NULL,
    "na",
    "N/A",
    "n/a",
    "NULL",
    999,
    -999,
    "999",
    "-999"
  )
  
  # find matches of NAs in df
  matches = is.na(dat) | sapply(dat, function(x){x %in% NA_aliases})
  
  # return df with row and coumn number having NA
  return(data.frame(
    row = row(dat)[matches], 
    column = col(dat)[matches], 
    value = dat[matches],
    stringsAsFactors = FALSE
  ))
}