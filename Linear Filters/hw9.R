library(astsa)
getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw9")
labour<-scan("labour.dat")
labour<-labour[1:144]
tlabour<-diff(diff(log(labour)),12)
tlabour.per<-mvspec(tlabour)
k2<-kernel("modified.daniell", c(2,2))
tlabour.smooth<-mvspec(tlabour, k2)
n<-length(tlabour)
np<-nextn(n)
which.max(tlabour.smooth$spec)
tlabour.smooth$spec[51]
df<-tlabour.smooth$df
U1<-qchisq(0.025,df)
L1<-qchisq(0.975,df)
c(df*tlabour.smooth$spec[51]/L1, df*tlabour.smooth$spec[51]/U1)

source("armasim.R")
RNGkind(sample.kind = "Rejection")
set.seed(12)
x<-armasim(c(0.8),0,1,200)
source("HW9function.R")
specplot(mvspec(x),phi=c(0.8), theta=0, ys=c(0,40))
k.mod<-kernel("modified.daniell",c(7,7,7,7,7,7,7,7,7,7))
specplot(mvspec(x, k.mod), phi=c(0.8), ys=c(0,40))


frequency<-seq(0,0.5,by=0.01)
power1<-abs(2/3*(cos(2*pi*frequency)-1))^2
plot(frequency,power1, type="l", main="Power Trasnfer Function")

