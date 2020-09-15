###Lab 1
### web source: https://aquarius.tw.rpi.edu/html/DA/EPI/
### Distributions, populations, fitting, filtering


## Eg
# Load and view data
EPI_data <- read.csv("C:/Users/YDBev/Desktop/F2020/EPI_data.csv")
View(EPI_data)
attach(EPI_data)  # sets the 'default' object, so the objects in the database can be accessed simply given their names
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
hist(EPI,seq(20.,95.,1.0),main="EPI Histogram", col="blue",prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.)) #bw=binwidth, or try bw="SJ")
rug(EPI) #add rug representation to the plot


# Fitting a distribution byond histograms - Cumulative density function
plot(ecdf(EPI),do.points=FALSE,verticals=TRUE)

#Quantile-Quantile
par(pty="s")
qqnorm(EPI);qqline(EPI)
#qqplot against tfhe generating distribution
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for tdsn")
qqline(x)


########################################################other 2 vars in EPI_data
### Ex1 Distributions, fitting
colnames(EPI_data)
DALY <- EPI_data$DALY
WATER_H <- EPI_data$WATER_H

# Exploration
summary(DALY)
fivenum(DALY, na.rm=TRUE)
stem(DALY)
hist(DALY, main="DALY Histogram", prob=TRUE); rug(DALY)
#
summary(WATER_H)
fivenum(WATER_H,na.rm=TRUE)
stem(WATER_H)
hist(WATER_H, main="WATER_H Histogram", prob=TRUE); rug(WATER_H)
boxplot(DALY,WATER_H,EPI)
# Others
fitdistr(DALY[!is.na(DALY)],'normal') # MASS package to estimate parameters

# Distribution fitting
plot(ecdf(DALY),do.points=FALSE,verticals=TRUE); par(pty="s") # set graphical parameters
qqnorm(DALY);qqline(DALY)
#qqplot against the generating distribution
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for tdsn"); qqline(x)

plot(ecdf(WATER_H),do.points=FALSE,verticals=TRUE); par(pty="s") # set graphical parameters
qqnorm(WATER_H);qqline(WATER_H)
#qqplot against the generating distribution
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for tdsn"); qqline(x)


##Compare
boxplot(EPI_data$ENVHEALTH, EPI_data$ECOSYSTEM, EPI_data$DALY, EPI_data$AIR_H,
EPI_data$WATER_H, EPI_data$AIR_E,EPI_data$WATER_E,EPI_data$BIODIVERSITY)

#############################################################################

## Ex 2, filtering
EPILand <- EPI_data$EPI[!Landlock]   #negates landlock countries
Eland <- EPILand[!is.na(EPILand)] 

summary(Eland)
fivenum(Eland,na.rm=TRUE)
stem(Eland)
hist(Eland, seq(30., 95., 1.0), main="Eland Histogram", prob=TRUE); rug(Eland)
boxplot(Eland)

E_noSurfacewater <- EPI_data$EPI[!No_surface_water]   
summary(E_noSurfacewater)
fivenum(E_noSurfacewater,na.rm=TRUE)
stem(E_noSurfacewater)
hist(E_noSurfacewater, seq(30., 95., 1.0), main="Eland Histogram", prob=TRUE); rug(E_noSurfacewater)
boxplot(E_noSurfacewater)

# DesertZeroToNA <- EPI_data$Desert[EPI_data$Desert == 0]
# EPI_data$Desert[EPI_data$Desert == 0] <- NA
E_desert <- EPI_data$EPI[Desert] 
table(EPI_data$Desert) # Check number of countries have desert [1] 
summary(E_desert)
fivenum(E_desert,na.rm=TRUE)
stem(E_desert)
hist(E_desert, seq(30., 95., 1.0), main="Eland Histogram", prob=TRUE); rug(E_desert)
boxplot(E_desert)

E_highPopulation <- EPI_data$EPI[High_Population_Density]   
summary(High_Population_Density)
fivenum(High_Population_Density,na.rm=TRUE)
stem(High_Population_Density)
hist(High_Population_Density, seq(30., 95., 1.0), main="Eland Histogram", prob=TRUE); rug(High_Population_Density)
boxplot(High_Population_Density)


EPI_data$EPI[EPI_data$EPI_regions == 'South Asia']
