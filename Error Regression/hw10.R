setwd("/Users/yunluli/Desktop/stat5170/Error Regression/")
library(astsa)
library(TSA)
plot(oil)
plot(gas)
result<-lm(gas~oil)
summary(result)
acf2(result$residuals)
sarima(gas,5,0,0,xreg=cbind(oil))
prewhiten(diff(oil),diff(gas), main="CCF of Diff Oil and Diff Gas")

par(mfrow=c(2,1))
plot(sales, main="Plot of Sales")
plot(lead, main="Plot of Lead")

par(mfrow=c(2,1))
plot(diff(sales), main="Plot of Diff Sales")
plot(diff(lead), main="Plot of Diff Lead")

prewhiten(diff(lead),diff(sales), main="CCF of Diff Sales and Diff Lead")
data<-cbind(diff(sales), lag(diff(sales),-1), lag(diff(lead),-3))
result2<-lm(data[,1]~data[,2]+data[,3])
acf2(result2$residuals)
sarima(data[,1], 0, 0, 2, xreg=data[,2:3])
