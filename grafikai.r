rm(list = ls())

grafikai = function(a)
{
tipas = "wmf" 

pav = colnames(a)
plot(a)
savePlot(filename = paste(pav, " normal.",tipas), type = tipas, device = dev.cur(), restoreConsole = TRUE)
plot(log(a))
savePlot(filename = paste(pav, " log.",tipas), type = tipas, device = dev.cur(), restoreConsole = TRUE)
}

vki = ts(read.csv2('data/vki.csv'), start = 1991, frequency = 12)
pal = ts(read.csv2('data/pal.csv'), start = 2004:10, frequency = 12)
min = ts(read.csv2('data/min alga.csv'), start = 1995, frequency = 12)
iki = ts(read.csv2('data/iki.csv'), start = 2006, frequency = 12)
oil = ts(read.csv2('data/oil.csv'), start = 2006, frequency = 12)

grafikai(vki)
grafikai(pal)
grafikai(min)
grafikai(iki)
grafikai(oil)