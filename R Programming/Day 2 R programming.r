mat1 = matrix(1:12, nrow=3)
mat1
r1 = c(4,3,6,8)

rownames(mat1) =c("anj","ask","anb")
mat1
##&      [,1] [,2] [,3] [,4]
##& anj    1    4    7   10
##& ask    2    5    8   11
##& anb    3    6    9   12

colnames(mat1) =c("Mi","Csk","Rcb","Hyd")
mat1
##&      Mi Csk Rcb Hyd
##& anj  1   4   7  10
##& ask  2   5   8  11
##& anb  3   6   9  12

mat1[2,3]
##&##& [1] 8

mat1["anj",4]
##&##& [1] 10

mat1["ask","Hyd"]
##&##& [1] 11

r1 ##&##& [1] 4 3 6 8
mat1= rbind(mat1,r1)
mat1
##&     Mi Csk Rcb Hyd
##& anj  1   4   7  10
##& ask  2   5   8  11
##& anb  3   6   9  12
##& r1   4   3   6   8

rownames (mat1)[4] = "abj"
mat1
##&     Mi Csk Rcb Hyd
##& anj  1   4   7  10
##& ask  2   5   8  11
##& anb  3   6   9  12
##& abj  4   3   6   8

cv=c(11,12,13,14)
mat1 = cbind(mat1,cv)
mat1
##&     Mi Csk Rcb Hyd cv
##& anj  1   4   7  10 11
##& ask  2   5   8  11 12
##& anb  3   6   9  12 13
##& abj  4   3   6   8 14

colnames(mat1)[5]= "kkr"
mat1
##&     Mi Csk Rcb Hyd kkr
##& anj  1   4   7  10  11
##& ask  2   5   8  11  12
##& anb  3   6   9  12  13
##& abj  4   3   6   8  14

nrow(mat1) ##&##& number of rows
ncol(mat1) ##&##& number of cols

dim(mat1) ##&##& [1] 4 5

temp1 = matrix(1:12, nrow=3)
temp1
##&      [,1] [,2] [,3] [,4]
##& [1,]    1    4    7   10
##& [2,]    2    5    8   11
##& [3,]    3    6    9   12

temp1 = cbind(temp1, c("a","b","c"))
temp1
##&      [,1] [,2] [,3] [,4] [,5]
##& [1,] "1"  "4"  "7"  "10" "a" 
##& [2,] "2"  "5"  "8"  "11" "b" 
##& [3,] "3"  "6"  "9"  "12" "c"
##&##& it will get converted in string



##==========================================================


n1 = c("Gayatri","Shikha","Rahul","Chetan")
n1
locn = c("MUM","DLI","BLR","CHN")
m1 = c(68,76,59,92)

stu_df = data.frame(n1, locn, m1)
stu_df

stu_df = data.frame(names=n1,location=locn, Marks=m1)
stu_df

new_df = data.frame(n1=c("suudeep", "rakesh"), k1=cc("BLR","GUJ"))
new_df

temp_df = rbind(temp_df,new_df)
colnames(new_df) = colnames(stu_df)

stu_df = rbind(stu_df,new_df)
stu_df

stu_df[1:3,]

stu_df[4:6,]

stu_df= rbind(stu_df[1:3,],new_df[4:6,])
stu_df

nrow(stu_df)

marks_AAS = c(70,80,60,55,75,82,91,85)
stu_df = cbind(stu_df,marks_AAS)

dim(stu_df)

stu_df[4,3]

stu_df[4,"Marks_PML"]

stu_df[,3]

stu_df[,"Marks_PML"]

stu_df$Marks_PML

stu_df$Marks_Ai = Marks_Ai
stu_df

##==============================File iMporting==============================

library(readxl)
df = read_excel('ERPData.xlsx',sheet = 'Info')
#head(df)
#tail(df)
#ncol(df)
#nrow(df)

#unique(df$MaterialID)
#length(unique(df$MaterialID))
#unique(df$Location)

#max(df$Quantity)

#df$Quantity

#which(df$Quantity == 27)
#df[c(3,31),]

#which(df$Quantity == max(df$Quantity))

#df[25,]

#df[25,c(1,2)]

# how many consignment and location has the max quantity
#which(df$Location == 'MWH-3')
# how many consignments are stored in MWH-3
#length(which(df$Location == 'MWH-3'))

# how many consignments of AXCP-78  are stored in MHW-2
#length(which(df$Location == 'MWH-2' & df$MaterialID == 'AXCP-78'))


new_df= df[which(df$Location == "MWH-3"),]
new_df
#new_df = subset(df, Location == "MWH-3")
#new_df
new_df= df[which(df$MaterialID == "GCVB-79"),]
new_df

new_df= df[which(df$MaterialID == "GCVB-79"),]
new_df


mydf2= df[which(df$Location == "MWH-2" & df$MaterialID == 'GCVB-79' ),]
mydf2

nrow(df[which(df$Location == "MWH-2" & df$MaterialID == 'GCVB-79' ),])


new_df= df[which(df$MaterialID == "GCVB-79"),]
new_df
sum(mydf2 [,3])


mydf3 = subset(df, df$MaterialID=="GCVB-79" & df$Location == "MWH-2")
mydf3



##============================================================================



#6*2+9=
  
##############################
my_func = function(a,b){
  (a*2)+b
  }
my_func(6,9)

##############################
my_func = function(a,b){
  x1=(a*2)+b
  print(x1)
}
#my_func(6,9)

##############################
calcTax= function(salary){
  tax=salary*0.1
  print(tax)
}
calcTax(100000)


##############################
calcTax1= function(){
  salary = as.numeric(readline('Please enter your salary '))
  tax=salary*0.1
  print(tax)
}
calcTax(100000)




##############################
user_name = readline('Please enter your name ')
dev
user_age = as.numeric(readline('Please enter your age '))
23


########################################
calcTax2= function(sal,rate){
  tax = sal*rate
  print(tax)
}
calcTax2(40000,0.8)

##############################
myfunc= function(a,b=3,c=7){
  d = a + b + c
  print(d)
}

myfunc(10,)   #Default Value: B,c
myfunc(10,3)  #Default Value: c
myfunc(10,,3) #Default Value: B

##############################
myfunc = function(sal){
  if (sal>20000) {
    tax=0.1*sal
  }
  else{
    tax=0
  }
  print(tax)
}

myfunc(20001)

##############################
myfunc = function (sal){
  if (sal<=20000){
    tax=0
  }
  else{
    if (sal < 50000 ){tax=sal*0.1}
    else{tax=sal*0.2}
  }
  print(tax)
}
myfunc(20000)
myfunc(25000)
myfunc(50000)

##############################

## sal = as.numeric(readline('Enter salary '))
## grade = ifelse(sal<=50000,'A','B')
## print(grade)
myfunc = function(){
  sal = as.numeric(readline('Enter salary'))
  if (sal<= 50000){
    grade="A"
  }else{
    grade="B"
  }
  print(grade)
}

myfunc()
2000
############# OR ################
sal = as.numeric(readline('Enter salary '))
200000
grade = ifelse(sal<=50000,'A',ifelse (sal <= 100000,'B','c'))
print(grade)


########################################

# client is a government company - tax = 5%
# client is a private company - tax = 15%
# client is an individual - tax = 10%

client = readline('Enter the type of client ')
govt
taxrate = switch(client, govt=5, pvt=15, individual=10, 20)
print(taxrate)
 
########################################
## for loop is used when the number of iterations are known beforehand


## while loop is use when number of iterations are not known but
## the loop continues till a particular condition remains true

for (ctr in 2:10){
  print(ctr**2)
}

myvect=c()
for (ctr in 1:4){
  n = as.numeric(readline("enter the number"))
  myvect = append(myvect,n)
}
print(myvect)

########################################
## Q wap to make numbers as the input fromusers save them as vector unless h

## condition for the while should be ensured to be true
## the variable used fro the entry condition should get changed inside the loop

my_vect = c()
n1 = 7
while(n1 != 0){
  n1= as.numeric (readline("enter the value :"))
  my_vect = append(my_vect,n1)
}
print(my_vect)

########################################
my_vect =c()
r = "Y"
while (r != "N"){
  n1 =as.numeric(readline("ENter your Value"))
  my_vect= append(my_vect,1)
  r = readline("Do you want to continue Y/N ")
}
print(my_vect)


########################################

cre=c("a","a","a","b",'b',"a","b")

install.packages("openxlsx")
library(openxlsx)
df = read_excel('ERPData.xlsx',sheet = 'Info')
df$Grade <- ifelse(df$Quantity <= 80, "A", "B")
head(df)

########################################
df = read_excel('CDAC_DataBook.xlsx',sheet = 'mtcars')

df$Grade <- ifelse(df$Quantity <= 80, "A", "B")
head(df)
