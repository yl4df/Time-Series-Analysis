getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw8")

source("arsim.R")
source("masim.R")

power.ma2<-function(theta1,theta2,omega)
{
  power<-(1+theta1^2+theta2^2+2*(theta1+theta1*theta2)*cos(2*pi*omega) + 2*theta2*cos(4*pi*omega))
}

frequency<-seq(0,0.5,by=0.01)

power1<-power.ma2(0.5,-0.9,frequency)

plot(frequency,power1, type="l", main="MA(2) with theta1=0.5 and theta2=-0.9")

frequency<-seq(0,0.5,by=0.01)

power2<-power.ma2(-0.5,0.9,frequency)

plot(frequency,power2, type="l", main="MA(2) with theta1=-0.9 and theta2=.5")


x1<-masim(c(0.5,-0.9),1,10000)

x2<-masim(c(-0.5, 0.9),1,10000)

par(mfrow=c(2,1))
plot.ts(x1[1:100], main="MA(2) with theta1=0.5 and theta2=-0.9")
plot.ts(x2[1:100], main="MA(2) with theta1=-0.9 and theta2=0.5")


