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

which(is.na(df$Deptt))
## [1] 4 6

which(!is.na(df$Deptt))
## [1] 1 2 3 5 7

which(duplicated(df$Passport))
#[1] 3 5 7

t1=unique(df$Passport)
t1
## [1] "DF453278" "CA567657" "RF453432" "ER534867"

which(df$Passport %in% t1)
## [1] 1 2 3 4 5 6 7

d1 = which(duplicated(df$Passport))
which(df$Passport[d1] %in% t1)
## [1] 1 2 3

d1
## [1] 3 5 7

df$Passport[d1]
## [1] "DF453278" "DF453278" "RF453432"

p1=unique(df$Passport[d1])
p1
## [1] "DF453278" "RF453432"

which(p1 %in% df$Passport)
## [1] 1 2
###==================================================

head(airquality)
#   Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2
#3    12     149 12.6   74     5   3
#4    18     313 11.5   62     5   4
#5    NA      NA 14.3   56     5   5
#6    28      NA 14.9   66     5   6

##
length(which(is.na(airquality$Ozone) | is.na(airquality$Ozone)))

length(which(is.na(airquality$Ozone) | is.na(airquality$Solar.R)))

length(which(airquality$Temp<=85 & airquality$Temp>=65))

nrow(airquality)
# [1] 153
d1 = airquality[which(airquality$Temp<=85 & airquality$Temp>=65),]
d1

d2=airquality[which(airquality$Temp>85 | airquality$Temp<65),]
d2

ind1= which(airquality$Temp>=65 & airquality$Temp<=85)
ind1

###############=====================#########################

head(airquality)

## Sorting of the Frames
x1 =c(4,6,9,2,5,8,1,3)
sort(x1)
# [1] 1 2 3 4 5 6 8 9
order(x1) ### it tells the index of lowest value
#[1] 4 6 9 2 5 8 1 3  ## original
#[1] 1 2 3 4 5 6 8 9  ## 1 is on
#[1] 7 4 8 1 5 2 6 3  ## the 7

sort(x1, decreasing = T)
# [1] 9 8 6 5 4 3 2 1

x2= c('dev', "arv" ,"bhav", "panda")
sort(x2)
# [1] "arv"   "bhav"  "dev"   "panda"

sort(x2, decreasing = T)
# [1] "panda" "dev"   "bhav"  "arv"

df= read_excel(file.choose())
df

min(df$Quantity)
max(df$Quantity)
order(df$Quantity)
df1 = df[order(df$Quantity),]
df1

tail(df)
head(df)
df

df = df[order(df$Quantity, decreasing=T),]
df

sort(unique(df$MaterialID))
length(which(df$MaterialID=="AXCP-78"))
length(which(df$MaterialID=="DDBN-89"))

length(df$MaterialID)

df= df[order(df$MaterialID),]
df

df2 =df[order(df$MaterialID , df$Location),]
df2

df14 = df[order(df$MaterialID , df$Quantity , df$ Location),]
df14
head(df14,5)


# MaterialId in the reverse alphabetical order
# location in the normal alphabetical order
# quantity in decreasing order


df14 = df[order(df$MaterialID , df$Quantity , df$ Location),]

ind2 = order(-xtfrm(df$MaterialID),df$Location , df$Quantity)

df3= df[ind2,]
df3



##================================================================
## Merging of the dataframes
## pune , mumbai

## getwd()
## setwd("//// file path"")

df1 = read_excel("CDAC_DataBookk.xlsx", sheet = "Pune")
df2 = read_excel("CDAC_DataBookk.xlsx", sheet = "Mumbai")
df1
#> df1
# A tibble: 5 × 3
#   Name   Subject    Grade
#  <chr>   <chr>      <chr>
#1 Rakesh  Python      A    
#2 Manoj   MLPython    C    
#3 Vaibhav Statistics  B    
#4 Hitesh  CommSkills  A    
#5 Suyash  ProjectMgmt B    

df2
#> df2
# A tibble: 5 × 3
#  Name     Subject    Grade
#  <chr>    <chr>      <chr>
#1 Vaibhav  Six Sigma  A    
#2 Deepika  Statistics B    
#3 Arjun    CommSkills A    
#4 Chetan   Python     A    
#5 Abhishek MLPython   B    

merge(df1,df2)
merge(df1,df2, all=F)
merge(df1,df2, by="Name")
merge(df1,df2, by=c("Name","Subject"))
df1
df2

merge(df1,df2, by="Name", all=T) 

merge(df1,df2, by="Name", all=T) 

merge(df1,df2, all=T) 
#       Name     Subject Grade
#1  Abhishek    MLPython     B
#2     Arjun  CommSkills     A
#3    Chetan      Python     A
#4   Deepika  Statistics     B
#5    Hitesh  CommSkills     A
#6     Manoj    MLPython     C
#7    Rakesh      Python     A
#8    Suyash ProjectMgmt     B
#9   Vaibhav   Six Sigma     A
#10  Vaibhav  Statistics     B
#11    Vinod          AI     B
#12    Vinod          AI     C


merge(df1,df2, by="Name", all.x = T)
#     Name   Subject.x Grade.x Subject.y Grade.y
#1  Hitesh  CommSkills       A      <NA>    <NA>
#2   Manoj    MLPython       C      <NA>    <NA>
#3  Rakesh      Python       A      <NA>    <NA>
#4  Suyash ProjectMgmt       B      <NA>    <NA>
#5 Vaibhav  Statistics       B Six Sigma       A
#6   Vinod          AI       B        AI       C
