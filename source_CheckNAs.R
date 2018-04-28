## Source code for the experimental 'atmor' R package
## Just a fun project ;)
## Dated: 280418
## Feedback: Jibran (jibran@envs.au.dk)
## Please inform if you notice any funny stuff

#### Sample data ####

dat <- read.csv("C:/Users/au550139/Desktop/sample_data.csv", sep=";")
View(dat)

#### Function to check NAs in df ####

check_NA <- function(dat){
  NA_det[] <- apply(dat, 2, function(x) any(is.na(x)))
  if ("TRUE" %in% NA_det[]){
    msg <- "NA exists"
  } else{
    msg <- "NA does not exist"}
  return(msg)}

# test function
check_NA(dat)

#### Function to locate instances of NAs (row and column) in sample df ####
## Just for fun ;)

find_NA <- function(dat){
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

# test function
find_NA(dat)


#### Function to fix NAs in df ####

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

# test fucntion
fix_NA(dat)
