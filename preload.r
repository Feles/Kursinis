rm(list = ls(all.names = TRUE))

setwd('..\\Kursinis')

vki <- window(ts(read.csv2('data/vki.csv'), start = 1991, frequency = 12) ,start = 2006, end = c(2011,7), freq = 12)
pal <- window(ts(read.csv2('data/pal.csv'), start = c(2004, 10), frequency = 12) ,start = 2006, end = c(2011,7), freq = 12)
iki <- ts(read.csv2('data/iki.csv'), start = 2006, frequency = 12)
oil <- ts(read.csv2('data/oil.csv'), start = 2006, frequency = 12)

colnames(vki) <- 'Vartotoju kainu indeksas'
colnames(pal) <- 'Vidutine 2 metu indelio palukanu norma'
colnames(iki) <- 'Importo kainu indeksas'
colnames(oil) <- 'Naftos kaina'

source('grafikai.r')