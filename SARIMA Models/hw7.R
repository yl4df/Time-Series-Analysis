getwd()
setwd("/Users/yunluli/Desktop/stat5170/hw7")
library(astsa)
table <- read.table("labour.dat")
labour<-table$V1[1:144]
plot.ts(labour, main="Times Series Plot of Labour")
plot.ts(diff(labour), main="Times Series Plot of Diff Labour")
acf2(diff(labour),50)
plot.ts(diff(diff(labour), 12), main="Times Series Plot of Seasonal Diff Labour")
acf2(diff(diff(labour),12),50)
fit1<-sarima(labour,1,1,0,1,1,0,12)
fit1
fit2<-sarima(labour,0,1,1,0,1,1,12)
fit2
fit3<-sarima(labour,2,1,0,2,1,0,12)
fit3
fit4<-sarima(labour,2,1,1,2,1,1,12)
fit4
fit5<-sarima(labour,1,1,1,1,1,1,12)
fit5
preds<-sarima.for(labour,24,0,1,1,0,1,1,12)
lines(145:168, table$V1[145:168], type="b", col="blue")
lower<-preds$pred - 1.96*preds$se
upper<-preds$pred + 1.96*preds$se
comp<-cbind(lower, table$V1[145:168], upper)
comp
