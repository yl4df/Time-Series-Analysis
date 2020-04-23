#Question 1
x<-matrix(c(1382.2,1114.4,1114.4,1382.2),nrow=2,ncol=2)
x_ins<-solve(x)
y<-matrix(c(1114.4,591.73),nrow=2)
phi<-x_ins%*%y
phi
e<-1382.2-t(y)%*%phi
e
1.96*e/10*(x_ins[1,1])**0.5
1.96*e/10*(x_ins[2,2])**0.5
x_ins
#Queation 2
getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw6")
library(astsa) ##for sarima() function, as well as acf2
cow<-scan("cow.dat")
cow_ts<-ts(cow)
plot(cow_ts, main="Time Series Plot of Cow Avg Temp")
acf2(cow_ts, 20,  main="ACF/PACF of Cow Avg Temp")
cow_log<-log(cow_ts)
dcow<-diff(cow_log)
plot(dcow, main="Time Series Plot of Diff$Log Cow Avg Temp")
acf2(dcow, 20,  main="ACF/PACF of Diff$Log Cow Avg Temp")
#############
##Fit MA(1)##
#############
fit1<-sarima(log(cow_ts), 0,1,1) 
fit1
#############
##Fit ARMA(1,1)##
#############
fit2<-sarima(log(cow_ts), 1,1,1)
fit2

fit0<-sarima(log(cow_ts), 2,1,0)
fit0

#Question 3
coal<-scan("bicoal.dat")
coal_ts<-ts(coal)
plot(coal_ts, main="Time Series Plot of Coal")
acf2(coal_ts, 20,  main="ACF/PACF of Coal")
dcoal<-diff(coal_ts)
plot(dcoal, main="Time Series Plot of Dff oal")
acf2(dcoal, 20,  main="ACF/PACF of Diff Coal")
#############
##Fit MA(2)##
#############
fit3<-sarima(coal_ts, 0,1,2) 
fit3
#############
##Fit AR(2)##
#############
fit4<-sarima(coal_ts, 2,1,0) 
fit4
#############
##Fit ARMA(1,1)##
#############
fit5<-sarima(coal_ts, 1,1,1)
fit5
#############
##Fit ARMA(2,2)##
#############
fit6<-sarima(coal_ts, 2,1,2)
fit6
fit7<-sarima(coal_ts, 2,1,1)
fit7
