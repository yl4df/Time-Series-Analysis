getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw1")
#Question 1
##(a)
### Output of 2*1:5 is a vector of 2, 4, 6, 8, 10 and output of (2*1):5 is a vector of 2, 3, 4, 5
### The difference is caused by the order of arithmetic. 2*1:5 gives a vector of 1, 2, 3, 4, 5 and then multiply 
### each one by two, so we have 2 4 6 8 10. (2*1):5 calcualtes 2*1=2 and then gives the vector from 2 to 5.

##(b)
seq(1,19,by=2)

##(c)
y=c(-1,2,-3,4,-5)
z <- abs(y)

##(d)
qchisq(0.95,df=10) 
#It is 18.30704

##(e)
x=rnorm(1000)
fivenum(x)
#The five number summary is -3.0974083 -0.7371085 -0.0108815  0.7257235  3.1626130
mean(x) 
#The mean is 0.005304152
var(x)
#The variance is 1.037968
hist(x)

#Question 2
gas <- scan("gas.dat")
plot.ts(gas, main="Time Series Plot")
