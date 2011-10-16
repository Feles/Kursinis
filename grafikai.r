rm(list = ls())

grafikai = function(a)
{
tipas = "jpeg" 

pav = colnames(a)
plot(a)
savePlot(filename = paste(pav, " normal.",tipas, sep=""), type = tipas, device = dev.cur(), restoreConsole = TRUE)
plot(log(a))
savePlot(filename = paste(pav, " log.",tipas,  sep=""), type = tipas, device = dev.cur(), restoreConsole = TRUE)
}

vki = ts(read.csv2('C:/data/vki.csv'), start = 1991, frequency = 12)
vki = vwindow(vki,start=2006,end=c(2011,7),freq=12)
pal = ts(read.csv2('C:/data/pal.csv'), start = 2004:10, frequency = 12)
pal = ts(pal,start=c(2004,10),freq=12)
pal = window(pal,start=c(2006,1),end=c(2011,7),freq=12)
iki = ts(read.csv2('C:/data/iki.csv'), start = 2006, frequency = 12)
oil = ts(read.csv2('C:/data/oil.csv'), start = 2006, frequency = 12)
oil = ts(oil,start=2006,freq=12)

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

#sezoniškumo panaikinimas

vki_s=vki-decompose(vki)$seasonal
pal_s=pal-decompose(pal)$seasonal 
iki_s=iki-decompose(iki)$seasonal
oil_s=oil-decompose(oil)$seasonal

loil_s.df=ur.df(log(oil_s),lags=5,selectlags="BIC",type="trend")
summary(loil_s.df)

#kai panaikiname sezoniškumą naftos kainos jau turi vienetinę šaknį

modelis1=lm(log(vki_s)~log(pal_s)+log(iki_s)+log(oil_s))
summary(modelis1)
