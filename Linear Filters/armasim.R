################
##ARMA process##
################

#######################################################
##Make sure to enter your phis and thetas as vectors.##
#######################################################

##################################################################################################################################
##If you have an AR process like in question 2a, type armasim(c(0.6,-0.8),0,1,10000). You must enter 0 for the vector for thetas##
##################################################################################################################################

armasim<-function(phis, thetas, sigsq, T){
p<-length(phis) 
q<-length(thetas)
m<-max(p,q)
noise<-rnorm(T+m, sd=sqrt(sigsq))
x<-c(noise[1:m],rep(0,T))
for (i in (m+1):(T+m)){
x[i]<-phis %*% x[i-(1:p)] + thetas %*% noise[i-(1:q)] + noise[i]
}
x<-x[(m+1):(T+m)]
x
}
