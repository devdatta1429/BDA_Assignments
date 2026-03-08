## database Management
## data cleaning
## identify the missing values
## identify the duplicates values
## data Validation
## NA <NA>

x1 = c(4,5,6,7)
x1
length(x1)

x1[7]=9
x1
## [1]  4  5  6  7  9 NA  9

x1[10]=9
x1
##  [1]  4  5  6  7  9 NA  9 NA NA 9

x1[1]= NA
x1
##  [1]  NA  5  6  7  9 NA  9 NA NA 9

is.na(x1) # results in a logical vector where value is a True for missing values

which(is.na(x1))
## returns a indexes where value is NA

## ==================================================
x2 =c("pune", "mumbai")
x2[4]="chennai"

x2
## [1] "pune"    "mumbai"  NA "chennai"

##=====================================================

install.packages("openxlsx")
library(openxlsx)

library(readxl)
df = read_excel(file.choose())
df

which(is.na(df$Deptt))
## [1] 4 6

which(is.na(df$Deptt) | is.na(df$EmpID))
## [1] 4 6 7

which(is.na(df$Deptt) & is.na(df$EmpID))
## [1] 6


which(complete.cases(df))
## [1] 1 2 5

which(!complete.cases(df))
## [1] 3 4 6 7