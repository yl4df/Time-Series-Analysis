getwd()

scan("soi.dat")

soi<-scan("soi.dat")

temp<-2

rm(temp)

plot(soi)

plot(soi,xlab="time",ylab="Southern Oscillation Index", main="Time Series Plot")

recruit<-scan("recruit.dat")

par(mfrow=c(1,2))

plot.ts(soi)
plot.ts(recruit)


jpeg("joint.jpg")
par(mfrow=c(1,2))
plot.ts(soi)
plot.ts(recruit)
dev.off()


