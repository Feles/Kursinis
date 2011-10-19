grafikai = function(a, tipas = 'pdf', ...)
{
pav = colnames(a)

plot(a, xlab = 'laikas')
savePlot(filename = paste('grafikai//',pav, ' lin.',tipas, sep=''), type = tipas, device = dev.cur(), restoreConsole = TRUE)

plot(log(a), xlab = 'laikas' , ylab = paste('log',pav))
savePlot(filename = paste('grafikai//',pav, ' log.',tipas,  sep=''), type = tipas, device = dev.cur(), restoreConsole = TRUE)

plot(decompose(vki), xlab = 'laikas')
savePlot(filename = paste('grafikai//',pav, ' decomposed.',tipas,  sep=''), type = tipas, device = dev.cur(), restoreConsole = TRUE)
}

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

#grafikai (perkelti i grafiku brezimo funkcija)

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
