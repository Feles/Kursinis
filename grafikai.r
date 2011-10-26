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


 grafikai(vki)
 grafikai(pal)
 grafikai(iki)
 grafikai(oil)
 grafikai(pk)


#grafikai (perkelti i grafiku brezimo funkcija)

 plot(decompose(vki))
 plot(decompose(pal))
 plot(decompose(iki))
 plot(decompose(oil))
 plot(decompose(pk))

#sezoniskumo panaikinimas

 vki_s<-vki-decompose(vki)$seasonal
 pal_s<-pal-decompose(pal)$seasonal 
 iki_s<-iki-decompose(iki)$seasonal
 oil_s<-oil-decompose(oil)$seasonal
 pk_s<-pk-decompose(pk)$seasonal

 lvki_s<-log(vki_s)
 lpal_s<-log(pal_s)
 loil_s<-log(oil_s)
 liki_s<-log(iki_s)
 lpk_s<-log(pk_s)
 

 loil_s.df<-ur.df(log(oil_s),lags=5,selectlags="BIC",type="trend")
 summary(loil_s.df)

#kai panaikiname sezoniskuma, visos komponentes turi vienetines saknis, norint sudaryti tiesini modeli, dar reikia atlikti kointegravimo testus

 modelis1<-lm(log(vki_s)~log(pal_s)+log(iki_s)+log(oil_s))
 summary(modelis1)

#(gero modelio liekanos sudaro BT), siuo atveju liekanos nera stacionarios

 tsdisplay(summary(modelis1)$res)

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

#modelis

#Modelio sudarymas

 tt <- time(vki)
 D <- ifelse(tt>=2009,1,0)
 
 mod<-dynlm(lvki_s~D+tt+tt*D+L(lpal_s,0:1)+L(loil_s,0:1)+L(liki_s,0:1)+L(lpk_s,0:1))
 summary(mod)

#panaikiname nereikšmingus kintamuosius
 mod<-dynlm(lvki_s~D+tt+tt*D+L(liki_s,1)+L(lpk_s,0:1))
 summary(mod)

#kointegravimo tikrinimas
 mod.res<-ts(mod$res,start=2006,freq=12)
 summary(dynlm(d(mod.res)~-1+L(mod.res),1:12))
#taigi su -3.34 kritine reiksme gauname, jog musu modelis yra kointegruotas procesas

#korekcijos modelis
 mod_ecm<-dynlm(d(lvki_s)~-1+L(mod.res)+L(d(lpal_s),0:1)+L(d(loil_s),0:1)+L(d(liki_s),0:1)+L(d(lpk_s),0:1))
 summary(mod_ecm)
#visi kintamieji yra nereikšmingi.

#Tirsime kitą modelį!
