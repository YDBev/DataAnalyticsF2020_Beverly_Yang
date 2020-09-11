# Lab1

# MASS library
install.packages("MASS") # installing the MASS package
library(MASS) # load the library MASS
attach(Boston) # attaching the dataset
?Boston # help function with "?" or hLEP("Boston)

head(Boston) # show the head of the dataset
dim(Boston) # dimensions of the dataset
names(Boston) # column names
str(Boston) # str function shows the structure of the dataset
nrow(Boston) # function shows the number of rows
ncol(Boston) # function shows the number of columns
summary(Boston) # summary() function shows the summary statistics
summary(Boston$crim) # summary of the "crime" column in the Boston dataset

#########################
#ISLR library
install.packages("ISLR") # installing the ISLR package
library(ISLR)
data("Auto") #load Auto data
?Auto

head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
boxplot(Auto$mpg)
hist(Auto$mpg)
summary(Auto$horsepower)
summary(Auto$weight)
fivenum(Auto$weight)
boxplot(Auto$weight)
mean(Auto$weight)
median((Auto$weight))


############### web source: https://aquarius.tw.rpi.edu/html/DA/EPI/
#2010EPI_data.csv
data1 <- read.csv(file.choose(),header=T)  #select .csv file
class(data1)
head(data1)
names(data1)   #or colnames(data1)
summary(data1)
EPI <- data1$EPI
fivenum(EPI, na.rm=TRUE)
stem(EPI)
boxplot(EPI)
hist(EPI)
hist(EPI,seq(20.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.)) #bw=binwidth, or try bw="SJ")
rug(EPI)
tf <- is.na(EPI)
E <- EPI[!tf] #filters out na

## use EPI_data.csv
# has NA
# use fivenum(EPI, na.rm=TRUE)
