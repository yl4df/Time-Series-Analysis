#Question 1
masim<-function(thetas, sigsq, T){
  q=length(thetas)
  noise<-rnorm(T+q, sd=sqrt(sigsq))
  x<-c(noise[1:q],rep(0,T))
  for (i in (q+1):(T+q)){
    x[i]<-thetas %*% noise[i-(1:q)] +noise[i]
  }
  x<-x[(q+1):(T+q)]
  x
}

#Question 2
x1<-masim(c(0.5,2),1,10000)
acf(x1)
x2<-masim(c(0.5,2),1,200)
acf(x2)

#Question 5
#(a)
setwd("/Users/yunluli/Desktop/stat5170/hw2")
ibm<-scan("dailyibm.dat", skip=1)
plot.ts(ibm, main="Time Series Plot")
acf(ibm)
#(b)
ibm_diff<-diff(ibm)
plot.ts(ibm_diff, main="Differenced Time Series Plot")
acf(ibm_diff)
#(c)
ibm_log<-log(ibm)
plot.ts(ibm_log, main="Log Time Series Plot")
acf(ibm_log)
#(d)
difflogibm<-diff(log(ibm))
plot.ts(difflogibm, main="Differenced Log Time Series Plot")
acf(difflogibm)
#(e)
difflogibm<-difflogibm[difflogibm> -0.1]
plot.ts(difflogibm, main="Differenced Log Time Series Plot")
acf(difflogibm)
difflogibm1<-difflogibm[1:500]
plot.ts(difflogibm1, main="Differenced Log Time Series Plot 1")
acf(difflogibm1)
difflogibm2<-difflogibm[501:length(difflogibm)]
plot.ts(difflogibm2, main="Differenced Log Time Series Plot 2")
acf(difflogibm2)
#(f)
mean(difflogibm2)
sqrt(var(difflogibm2))
