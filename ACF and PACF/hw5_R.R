getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw5")
source("armasim.R")
library(astsa)
##Question 1
#(a)
x1<-armasim(c(0.6,-0.8),0,1,1000)
acf2(x1,20,main="AR(2)")
#(b)
x2<-armasim(0,c(0.8,0.7),1,1000)
acf2(x2,20,main="MA(2)")
#(c)
x3<-armasim(c(0.8),c(0.8),1,1000)
acf2(x3,20,main="ARMA(1,1)")
##Question 2
#(a)
berk<-scan("berkeley.dat", what=list(double(0),double(0),double(0)))
berkeley<-berk[[2]]
stbarb<-berk[[3]]
acf2(berkeley,20,main="Berkeley")
acf2(stbarb,20,main="Santa Barbara")
#(b)
diff_berkeley<-diff(berkeley)
acf2(diff_berkeley,20,main="Differenced Berkeley")
diff_stbarb<-diff(stbarb)
acf2(diff_stbarb,20,main="Differenced Santa Barbara")
##Question 4
#(a)
phi1<-c(1,-1.1,0.5)
polyroot(phi1)

