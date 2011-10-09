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

vki = window(ts(read.csv2('data/vki.csv'), start = 1991, frequency = 12) ,start = 2006, freq = 12)
pal = window(ts(read.csv2('data/pal.csv'), start = c(2004, 10), frequency = 12) ,start = 2006, freq = 12)
min = window(ts(read.csv2('data/min alga.csv'), start = 1995, frequency = 12),start = 2006, freq = 12)
#iki = ts(read.csv2('data/iki.csv'), start = 2006, frequency = 12)
#oil = ts(read.csv2('data/oil.csv'), start = 2006, frequency = 12)

grafikai(vki)
grafikai(pal)
grafikai(min)
#grafikai(iki)
#grafikai(oil)