################
##add function##
################

add<-function(a,b){
result<-a+b
result}

add(2,3)

########################
##random walk function##
########################

randomwalk<-function(sigsq,T){
x<-rep(0,T)
w<-rnorm(T,sd=sqrt(sigsq))
for ( i in 2:T){
x[i]<-x[i-1]+w[i]
}
x
}

path1<-randomwalk(1,10)
par(mfrow=c(2,1))
plot.ts(path1, main="Random Walk with 10 Observations")
acf(path1, main="Corresponding ACF")

path2<-randomwalk(1,100)
par(mfrow=c(2,1))
plot.ts(path2, main="Random Walk with 100 Observations")
acf(path2, main="Corresponding ACF")

###############
##ar function##
###############

arsim<-function(phis, sigsq, T){
p<-length(phis) #find the number of lags in our AR
noise<-rnorm(T+p, sd=sqrt(sigsq)) #generate the white noise plus a few to get started
x<-c(noise[1:p],rep(0,T)) #put the initial noise terms in and set the rest to zero
for (i in (p+1):(T+p)){ #this loop generates the AR series with the recursive formula
x[i]<-phis %*% x[i-(1:p)] +noise[i]
}
x<-x[(p+1):(T+p)] #throw away those initial starting points
x #return
}

x1<-arsim(c(0.5), 1,200)

par(mfrow=c(2,1))
plot.ts(x1,main="TS Plot of AR(1), phi=0.5, 200 Observations")
acf(x1,main="Corresponding ACF Plot")

x2<-arsim(c(-0.5), 1,200)

par(mfrow=c(2,1))
plot.ts(x2,main="TS Plot of AR(1), phi=-0.5, 200 Observations")
acf(x2,main="Corresponding ACF Plot")

x3<-arsim(c(1.1), 1,200)

par(mfrow=c(2,1))
plot.ts(x3,main="TS Plot of AR(1), phi=1.1, 200 Observations")
acf(x3,main="Corresponding ACF Plot")
