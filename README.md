# atmor

An experimental R package to handle multiple dataset issues i.e., from data cleaning/handling to plotting and so on.
Currently handles NAs only.


# Functions

There are three basic functions as part of this package.

1) check_NA: This function checks whethere there are NA in the data frame.

2) find_NA: This function locates rows and columns in a data frame having NA.

3) fix_NA: This function replaces NAs by the blanks.


# Installation

```
library(devtools)
#if you don't have the package, run install.packages("devtools")
install_github("kjibran/atmor")
```

# Test dataset

The sample data is also provided to test the package. However, users are welcome to test the functions on other dataset.


# Usage

```
library(atmor)
#assuming dat=dataset to be tested
atmor::check_NA(dat)
atmor::find_NA(dat)
atmor::fix_NA(dat)
```

# Example

```
atmor::check_NA(dat)
#[1] "NA exists"
```
