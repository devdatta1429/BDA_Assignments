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


#####################################=====================###########################

install.packages('dplyr')
install.packages('tidyr')


library(tidyr)
library(dplyr)

head(mtcars)

mean(mtcars$wt)

mean(mtcars$mpg)

##summarise(mt )

str(t1)

unique(mtcars$gear)

filter(mtcars,mpg>=20)

filter(mtcars,mpg>=20,gear==4)

sample_frac(mtcars,0.1)

sample_n(mtcars,5)

select(mtcars,mpg,wt)

select(mtcars,-mpg,-wt)

df1= mutate(mtcars, Eff=mpg/wt)
df1$Eff = round(df1$Eff, 2)
df1


###########=================########################

library(tidyr)


df = read_excel ('CDAC_DataBookk.xlsx', sheet ='Health')
df

# A tibble: 12 × 5
#   Country Disease      `2019` `2020` `2021`
#   <chr>   <chr>         <dbl>  <dbl>  <dbl>
# 1 India   Cancer           12     94     35
# 2 UK      Cancer           95     19     84
# 3 US      Cancer           98     19     53
# 4 Japan   Cancer           89     52     14
# 5 India   Covid            38     19     62
# 6 UK      Covid            69     73     35
# 7 US      Covid            87     97     35
# 8 Japan   Covid            14     12     90
# 9 India   Heart Attack     84     10     98
#10 UK      Heart Attack     44     17     24
#11 US      Heart Attack     34     40     54
#12 Japan   Heart Attack     11     43     75

df1 = gather(df,Year,Cases,c('2019','2020','2021'))
df1

dim(df1)
# [1] 36  4

df2= spread(df1, Disease,Cases)
df2
# A tibble: 12 × 5
#    Country Year  Cancer Covid `Heart Attack`
#   <chr>   <chr>  <dbl> <dbl>          <dbl>
# 1 India   2019      12    38             84
# 2 India   2020      94    19             10
# 3 India   2021      35    62             98
# 4 Japan   2019      89    14             11
# 5 Japan   2020      52    12             43
# 6 Japan   2021      14    90             75
# 7 UK      2019      95    69             44
# 8 UK      2020      19    73             17
# 9 UK      2021      84    35             24
#10 US      2019      98    87             34
#11 US      2020      19    97             40
#12 US      2021      53    35             54


df3 = spread(df1,Country,Cases)
df3
# A tibble: 9 × 6
#   Disease      Year  India Japan    UK    US
#   <chr>        <chr> <dbl> <dbl> <dbl> <dbl>
# 1 Cancer       2019     12    89    95    98
# 2 Cancer       2020     94    52    19    19
# 3 Cancer       2021     35    14    84    53
# 4 Covid        2019     38    14    69    87
# 5 Covid        2020     19    12    73    97
# 6 Covid        2021     62    90    35    35
# 7 Heart Attack 2019     84    11    44    34
# 8 Heart Attack 2020     10    43    17    40
# 9 Heart Attack 2021     98    75    24    54
