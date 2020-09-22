### 9/18 in class Lec 4 - Lab 2
## multivariate data

multivariate <- read.csv("C:/Users/YDBev/Desktop/F2020/DataAnalytics/multivariate.csv")
attach(multivariate) # The database is attached to the R search path. This means that the database is searched by R when evaluating a variable, so objects in the database can be accessed by simply giving their names.
# The search() function can be used to list attached objects and packages. 
# detach() the dataset to clean up after ourselves.
mm <- lm(Homeowners~Immigrant) # lm: fitting linear models Homeowners - dependent var, immigrant - independent var
mm
# plot
plot(Immigrant,Homeowners) # homeowners vs immigrant     # plot(Immigrant~Homeowners) immigrant vs homeowners
abline # add staight lines to plot
abline(mm, col=2, lwd=3)
# summary
summary(mm)
attriutes(mm)
mm$coefficients
# coefficients FOR INEAR MODEL PREDICTION
cm <- coef(mm)  
cm

## INCLUDE MULTIPLE INDEPENDENT VARALBES
HP <- Homeowners/Population # %homeowners
PD <- Population/area       # %population density
mm_HPPD <- lm(Immigrant~Income+Population+HP+PD)   
summary(mm_HPPD)
# Plot
plot(Income,Immigrant)
plot(Population,Immigrant)
plot(HP,Immigrant)
plot(PD,Immigrant)
# Combine HP,PD columns
multi_comb <- cbind(multivariate,HP,PD)
# Coefficient
cm_HPPD <- coef(mm_HPPD)
cm_HPPD
# predict.lm makes predictions for new input variables 

