x <- 2
class(x)
is.numeric(x)

i <- 5L
class(i)

4L*2.8
class(5L/2L)

#Text Data
 
x <- "data"
x
class(x)

y <- "factor"

y <- factor("data")

nchar("Hello")
nchar(1)
nchar(452)

date1 <- as.Date("2012-06-28")
date1
as.numeric(date1)

?as.numeric

#Advance data structures in R

x <- 1:3
y <- -2:0
c<- c("Kumar","Ajinkya","Shamali")

df <- data.frame(x,y,c)
nrow(df)   # to get no of rows
ncol(df)    # to get columns
names(df)      #to get names of column
names(df)[2]   #to get names of second column
head(df)
head(df,n=2)
class(df)

list1 <- list(1:4,5:8)
list1

matrix_form <- do.call(rbind, list1)
matrix_form

#Reading Data into R
library(readxl)
Purchase <- read_excel(path = "C:\\Users\\Kumar\\OneDrive - OnPoint Insights LLC\\Purchase Order.xlsx")
Purchase


head(Purchase, n=3)
class(Purchase$`Purchase Order Date`)
class(Purchase$Email)









