cat("Hello, World!")# # k1 = 9L
# # k1
# # str(k1)

# # k11 = 9.3
# # k11
# # str(k11)

# # k2 = 9
# # k2
# # str(k2)

# # k3 ='dev\'s laptop'
# # k3
# # str(k3)

# # k4 =F
# # k4
# # str(k4)

# k1=c(1,2,3)
# k1
# str(k1)

# k2=c('dev','thorat', "arv")
# k2
# str(k2)

# k3=c(1,2,3,"dev")
# k3
# str(k3)
# length(k3)

# k3[1:3]
# k3[-2:-3]
# k3[-4:-2]
# k3

# append(k2,5)
# k2

# k2 =append(k2,5)
# k2

# k2 =append(k2,11,3)
# k2

# k1=c(1,2,3,4)
# k2=c(5,6,7,8)
# k1=append(k1,k2)
# # k1=append(k1,11,0) #[1] 11  1  2  3  4  5  6  7  8
# # k1=append(k1,11,1) #[1]  1 11  2  3  4  5  6  7  8
# # k1=append(k1,11)  #[1]  1  2  3  4  5  6  7  8 11
# k1

# emp=c()
# emp=append(emp,1)
# emp

# emp=append(emp,2)
# emp

# x1 = 2
# x2 = 3
# x3 = x1 + x2
# x3
# str(x3)

# z= c(11,12,13,14,17,18,19,20)
# z1=c(15,16)
# z=append(z,z1,4) ## insert multiple values at at index
# z
# length(z)

# ##----------------------------Replacing the value----------------------------------------
# z        #[1] 11 12 13 14 15 16 17 18 19 20
# z[9]=21  #[1] 11 12 13 14 15 16 17 18 21 20
# z

# ##----------------------------Deleting the value----------------------------------------
# z = z[-10] #[1] 11 12 13 14 15 16 17 18 21
# z             

# ##----------------------------Extracting multiple values----------------------------------------

# # extracts values from 3rd, 6th and 8th index
# z[c(3,6,8)] #[1] 13 16 18

#   ##----------------------------modify or update multiple values at single time----------------------------------------

# z[c(3,6,8)] = c(23,26,28) ## [1] 11 12 23 14 15 26 17 28 21
# z

# z[c(3,6,8)] = c(13,16,18)
# z
# ##----------------------------deleting multiple values----------------------------------------

# # extracts values from 3rd, 6th and 8th index
# z = z[-c(3,6,8)]
# z

##--------------------------Sum of all values----------------------------------------
z= c(11,12,13,14,15,16,17,18,19,20)
z
sum(z)  ## addition
min(z)  ## minimum
max(z)  ## maximum
prod(z) ## multiplication

cumsum(z)
##   [1] 11  12  13  14  15  16  17  18   19   20
##  [1]  11  23  36  50  65  81  98  116  135  155

cumsum(z)[5]
##   [1] 11  12  13  14  15  
##  [1]  11  23  36  50  65 

cummin(z) ## [1] 11 11 11 11 11 11 11 11 11 11
cummax(z) ## [1] 11 12 13 14 15 16 17 18 19 20



####----------------------- vectors Methods-----------------------------
####-----------------------Recycling of vectors-----------------------------
x1 = c(5,3,2,7)
x2 = c(1,2,3,4)
x3 = c(6,8)
x4 = c(4,7,3)

# cas1 : operating a vector with saclar quantity
x1 + 5 ## [1] 10  8  7 12
x1    ##  [1] 5 3 2 7

x1*2  ## [1] 10  6  4 14
x1    ## [1] 5 3 2 7

# case 2 : operating two vector with saclar length
x1 + x2  ## [1]  6  5  5 11

x1 / x2  ## [1] 5.0000000 1.5000000 0.6666667 1.7500000

x1 ** x2 ## [1]    5    9    8 2401

## case 3 : operating two vectors of difffernt legnth 
## but the length of the longer vector is an exact multiple of legnth odf samller vector

x1
x3

x1 + x3 ## 5   3  2  7
        ## 6   8  6  8
        ## 11 11  8 15

x1 * x3 ## 5   3  2  7
        ## 6   8  6  8
        ##30  24 12 56
        
x1 * x4 
# Warning message:
# In x1 * x4 :
# longer object length is not a multiple of shorter object length


##--------------------Creating special vectors-------------------------
x1 = 40:70 ## [1] 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 
x1         ## 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70


## Sequencial commands - when we wish to create vectors with equal gaps between two values
x1 = seq(1,14) ##[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14
x1

x1 =seq(0,30,3)  ##  [1]  0  3  6  9 12 15 18 21 24 27 30
x1

x1 = seq(30,9,-3) ## [1] 30 27 24 21 18 15 12  9
x1

x1 = seq(4,46,length.out=11)
x1

x1 = seq(1,100,length.out=12)
x1


##----------------------------------REP command------------------------------
## used when a particular pattern has to be repeated in a vector
z1 = rep(c(1,2,3), times=4) ## [1] 1 2 3 1 2 3 1 2 3 1 2 3
z1

z1 = rep(c(4,5,6),4) ## [1] 4 5 6 4 5 6 4 5 6 4 5 6
z1

z1 = rep(c(7,8,9), each= 4) ## [1] 7 7 7 7 8 8 8 8 9 9 9 9
z1

z1 = rep(c(4,3,2,1), times=c(4,3,2,1)) ## [1]  [1] 4 4 4 4 3 3 3 2 2 1
z1

##base of the log (by deafault) is taken as e
## e = 2.7182

log(45)

2.7182 ** 3.806662

exp(3.806662)

## Natural log og 45 is 3.8066. 
## antilog of 3.8066 or exp of 3.8066 is 45

log(45,2)

2^5.491853

##---------------------------------------------------------------------------------
##logical operators
x1 = T
x2 = T
x3 = F
x4 = F

str(x3)

## AND operator
x1 & x2 ## [1] TRUE

x1 & x4 ## [1] FALSE

(x1&x2) & (x3&x4)
# True and False

## OR operator

(x1&x2) | (x3&x4) ## True
# True or False

# NOT Operation
!x1 # True
!x4 # False


## which command
x1=c(7,6,4,8,3,5,2,6,9,3,2,7)
length (x1)

k1 = 8
k1 == 8
k1 == 7

which(x1<4)

length(which(x1<4)) #[1] 3 

x1[x1<4]


##----------------------------------------------------
x1=c(7,6,4,8,3,5,2,6,9,3,2,7)


# x1= x1[-which(x1==6)]    ## removes all the occurances of 6
# x1= x1[-which(x1==6)][1] ## removes the first occurances of 6
x1[which(x1==6)]

which(x1==6)[1]


#####################################################################################

# x1 = c('Bangalore','Pune','Navi Mumbai','Nagpur','Hyderabad','Raipur')
# length(x1)
# # [1] 6

# nchar(x1) ##number of characters(including spaces) in each value
# # [1]  9  4 11  6  9  6

# grep("pur",x1)
# #[1] 4 6

# grep("pur",x1)
# #[1] 4 6

# grep("pur",x1 ,value=T)
# # [1] "Nagpur" "Raipur" returns value

# substr(x1,2,7)
# [1] "angalo" "une"    "avi Mu" "agpur"  "yderab" "aipur" 

# gsub("pur","pore",x1)

##----------------------------------------------------------------------------------

# r1 = "sudeep bhargava"

# nchar(r1)

# r1_parts = strsplit(r1," ")[[1]]
# r1_parts

# length(r1_parts)

# nchar(r1_parts)

# r1_chrs = strsplit(r1, "")[[1]] ##[1] "s" "u" "d" "e" "e" "p" " " "b" "h" "a" "r" "g" "a" "v" "a"
# r1_chrs

# length(r1_chrs) ##[1] 15

##-------------------------------------------------------------

a1= c("a", "b", "c")
b1= c(1,2,3)
paste(a1,b1)

a3=(paste(a1,b1))
a3
length(a3)

nchar(a3)

paste(a1,b1,sep=" ")

paste(a1,b1,sep="-")
#"a-1" "b-2" "c-3"

a3 = paste(a1,b1,sep="")
a3 ## [1] "a1" "b2" "c3"
length(a3)

nchar(a3) ##[1] 2 2 2

a3=paste(a1,b1,sep="-",collapse='***')
a3  ##"a-1***b-2***c-3"

length(a3)
nchar(a3)

##---------------------------MATRIX------------------------------------------
mat1 =matrix(1:24,ncol=6)
mat1
#       [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    5    9   13   17   21
# [2,]    2    6   10   14   18   22
# [3,]    3    7   11   15   19   23
# [4,]    4    8   12   16   20   24



mat1 =matrix(1:24,ncol=5)
mat1

#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    6   11   16   21
# [2,]    2    7   12   17   22
# [3,]    3    8   13   18   23
# [4,]    4    9   14   19   24
# [5,]    5   10   15   20    1

# Warning message:
# In matrix(1:24, ncol = 5) :
#   data length [24] is not a sub-multiple or multiple of the number of rows [5]

mat1 =matrix(1:12,nrow=3)
mat1

#      [,1] [,2] [,3] [,4]
# [1,]    1    4    7   10
# [2,]    2    5    8   11
# [3,]    3    6    9   12

# Warning message:
# In matrix(1:24, ncol = 5) :
#   data length [24] is not a sub-multiple or multiple of the number of rows [5]

mat1[2,3] ##[1] 8
mat1[3,2] ##[1] 6
mat1[2,]  ## [1]  2  5  8 11