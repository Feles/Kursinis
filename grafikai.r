rm(list <- ls())

grafikai <- function(a)
{
tipas <- "jpeg" 

pav <- colnames(a)
plot(a)
savePlot(filename <- paste(pav, " normal.",tipas, sep=""), type = tipas, device = dev.cur(), restoreConsole = TRUE)
plot(log(a))
savePlot(filename <- paste(pav, " log.",tipas,  sep=""), type = tipas, device = dev.cur(), restoreConsole = TRUE)
}

vki <- ts(read.csv2('C:/data/vki.csv'), start = 1991, frequency = 12)
vki <- vwindow(vki,start=2006,end=c(2011,7),freq=12)
pal <- ts(read.csv2('C:/data/pal.csv'), start = 2004:10, frequency = 12)
pal <- ts(pal,start=c(2004,10),freq=12)
pal <- window(pal,start=c(2006,1),end=c(2011,7),freq=12)
iki <- ts(read.csv2('C:/data/iki.csv'), start = 2006, frequency = 12)
oil <- ts(read.csv2('C:/data/oil.csv'), start = 2006, frequency = 12)
oil <- ts(oil,start=2006,freq=12)

#kol kas neturime disponuojamu menesiniu gyventoju pajamu,- jas itrauksime veliau
grafikai(vki)
grafikai(pal)
grafikai(iki)
grafikai(oil)

#tikriname, ar komponentes turi trenda

trend.test(vki)
trend.test(pal)  
trend.test(iki)
trend.test(oil)

#grafikai

plot(decompose(vki))
plot(decompose(pal))
plot(decompose(iki))
plot(decompose(oil))

#sezoniskumo panaikinimas

vki_s<-vki-decompose(vki)$seasonal
pal_s<-pal-decompose(pal)$seasonal 
iki_s<-iki-decompose(iki)$seasonal
oil_s<-oil-decompose(oil)$seasonal

loil_s.df<-ur.df(log(oil_s),lags=5,selectlags="BIC",type="trend")
summary(loil_s.df)

#kai panaikiname sezoniskuma, visos komponentes turi vienetines saknis, norint sudaryti tiesini modeli, dar reikia atlikti kointegravimo testus

#modelis1<-lm(log(vki_s)~log(pal_s)+log(iki_s)+log(oil_s))
#summary(modelis1)

#atliekame kointegravimo testus su -4.96 kritine reiksme

 m<-lm(vki_s~iki_s)
 beta<-coef(m)
 sprd<-vki_s-beta*iki_s
 adf.test(sprd, alternative="stationary", k=3)

 m1<-lm(vki_s~pal_s)
 beta1<-coef(m1)
 sprd1<-vki_s-beta1*pal_s
 adf.test(sprd1, alternative="stationary", k=3)

 m2<-lm(vki_s~oil_s)
 beta2<-coef(m2)
 sprd2<-vki_s-beta2*oil_s
 adf.test(sprd2, alternative="stationary", k=3)

#visais atvejais liekanos turi vienetine sakni, todel reikes isdiferencijuoti ir modeli sudaryti skirtumams
