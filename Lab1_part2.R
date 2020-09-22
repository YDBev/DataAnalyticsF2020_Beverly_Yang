### Lab1_part2, 9/22 - Lec 5
## mtcars dataset
library(ggplot2)
attach(mtcars)
attach(BOD)
attach(ToothGrowth)

plot(mtcars$wt,mtcars$mpg)
qplot(mtcars$wt, mtcars$mpg) # essentially the same as the plot function 
qplot(wt,mpg,data=mtcars)    # same thing as above 
ggplot (mtcars,aes(x=wt,y=mpg)) + geom_point()  # geom_point: creat scatterplot point

plot(pressure$temperature,pressure$pressure, type="l")
points(pressure$temperature,pressure$pressure) # or above but type = "o"
lines(pressure$temperature,pressure$pressure/2, col="red")
points(pressure$temperature,pressure$pressure/2, col='blue')

qplot(pressure$temperature,pressure$pressure,geom="line")
qplot(temperature,pressure,data = pressure, geom="line")
# qplot() is a shortcut designed to be familiar if you're used to base plot().
# geom: draw
ggplot(pressure,aes(x=temperature, y=pressure)) + geom_line() + geom_point()



## Bar graphs
BOD
barplot(BOD$demand, names.arg = BOD$Time) # vector of names to be plotted below each bar or group of bars.
names(mtcars)
table(mtcars$cyl) # tabulation of data with the variable and its frequency
barplot(table(mtcars$cyl)) # table of counts

qplot(mtcars$cyl) # continous
qplot(factor(mtcars$cyl)) # auto ID levels and make cyl. as discrete
qplot(factor(cyl), data=mtcars) # same as above 
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar() #same as above



## Histogram
hist(mtcars$mpg)
#  breaks: cutoff points for the bins, larger number, larger bin width, fits more data points
hist(mtcars$mpg, breaks = 10) # number of bins with breaks
hist(mtcars$mpg, breaks = 5)
hist(mtcars$mpg, breaks = 12)

qplot(mpg,data = mtcars, binwidth = 4 )
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5)



## Box plots
ToothGrowth
plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len ~ supp + dose, data = ToothGrowth) # combine two variables on the x-axis

qplot(ToothGrowth$supp, ToothGrowth$len, geom = "boxplot")
qplot(supp, len, data = ToothGrowth, geom = "boxplot") # same as above
ggplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot() # same as above

# three separate vectors 
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")
qplot(interaction(dose, supp), len, data = ToothGrowth , geom = "boxplot") # same as above
ggplot(ToothGrowth, aes(x=interaction(supp,dose),y=len)) + geom_boxplot()
