###Lab 1
### web source: https://aquarius.tw.rpi.edu/html/DA/EPI/
### Distributions, populations, fitting, creating data frames

##Ex1
# Load and view data
EPI_data <- read.csv("C:/Users/YDBev/Desktop/F2020/EPI_data.csv")
View(EPI_data)
attach(EPI_data)
fix(EPI_data)
EPI <- EPI_data$EPI

tf <- is.na(EPI)
E <- EPI[!tf] #filters out NA
E_length <- length(E)
EPI_length <- length(EPI)

#Summary
summary(EPI)
fivenum(EPI,na.rm=TRUE)

#Plots
stem(EPI)
boxplot(EPI)
hist(EPI,seq(20.,95.,1.0),main="EPI_data Histogram", col="blue",prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.)) #bw=binwidth, or try bw="SJ")
rug(EPI)

#Cumulative density function
plot(ecdf(EPI),do.points=FALSE,verticals=TRUE)

#Quantile-Quantile
par(pty="s")
qqnorm(EPI);qqline(EPI)
#qqplot against tfhe generating distribution
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for tdsn")
qqline(x)


#################other 2 vars in EPI_data
colnames(EPI_data)
DALY <- EPI_data$DALY
WATER_H <- EPI_data$WATER_H
summary(DALY)
summary(WATER_H)
fivenum(DALY,na.rm=TRUE)
fivenum(WATER_H,na.rm=TRUE)
stem(DALY)
stem(WATER_H)
boxplot(DALY,WATER_H,EPI)

##Compare
boxplot(EPI_data$ENVHEALTH, EPI_data$ECOSYSTEM, EPI_data$DALY, EPI_data$AIR_H,
EPI_data$WATER_H, EPI_data$AIR_E,EPI_data$WATER_E,EPI_data$BIODIVERSITY)



##Ex 
EPILand <- EPI_data$EPI[!Landlock]   #negates landlock countries
Eland <- EPILand[!is.na(EPILand)] 
hist(Eland)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)