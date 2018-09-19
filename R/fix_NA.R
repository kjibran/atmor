#' Function to replace NAs with blanks
#' Sample data to test the package and its functions, is also provided
#' MKE added this comment to check GIT
#'
#' @param dat input dataset. Currently only supports \code{data.frame}. While, \code{data.table} is not supported.
#' @export

#Start of function
fix_NA <- function(dat){

  # check if dataset is "data.frame"
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

  # check if df has identifiable aliases of
  matches = is.na(dat) | sapply(dat, function(x){x %in% NA_aliases})
  if(sum(matches)==0){
    stop("This data.frame has no identifiable NA aliases.")
  }

  # replace NAs by blanks
  dat[is.na(dat)] <- " "
  return(dat)
}
#End of function
