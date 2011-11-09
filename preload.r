#Panaikiname visus kintamuosius ið praetø sesijø
rm(list = ls(all.names = TRUE))

#Nustatome darbinæ direktorijà
setwd('../Kursinis')

#Prijungiame rikalingus paketus
library(forecast)
library(tseries)
<<<<<<< HEAD
library(urca)
library(dynlm)

vki <- window(ts(read.csv2('data/vki.csv'), start = 1991, frequency = 12) ,start = 2006, end = c(2011,7), freq = 12)
pal <- window(ts(read.csv2('data/pal.csv'), start = c(2004, 10), frequency = 12) ,start = 2006, end = c(2011,7), freq = 12)
iki <- ts(read.csv2('data/iki.csv'), start = 2006, frequency = 12)
oil <- ts(read.csv2('data/oil.csv'), start = 2006, frequency = 12)
pk  <- ts(read.csv2('data/pk.csv'),start=2006, frequency = 12)
=======
library(xtable)
library(pastecs)
library(urca)
library(dynlm)

#Nusiskaitome duomenis 
vki <- window(ts(read.csv2('data/VKI K.csv'), start = 1991, frequency = 4),start = 1995, end = c(2011, 2), freq = 4)
oil_usd <- window(ts(read.csv2('data/OIL K.csv'), start = 1990, frequency = 4),start = 1995, end = c(2011, 2), freq = 4)
usd_ltl <- window(ts(read.csv2('data/LtlUsd K.csv'), start = c(1993, 3), frequency = 4),start = 1995, end = c(2011, 2), freq = 4)
Alga <- ts(read.csv2('data/Alga K.csv'), start = 1995, frequency = 4)
BVP <- window(ts(read.csv2('data/BVP K.csv'), start = 1993, frequency = 4),start = 1995, end = c(2011, 2), freq = 4)
>>>>>>> 3ee2881986da4d733784c42d10de9d8a7a1f3a23


oil <- oil_usd *usd_ltl
ulc <- Alga / BVP

colnames(vki) <- 'Vartotojø kainø indeksas'
colnames(oil) <- 'Naftos kaina LTL/BRL'


#Pradedame analizæ:

#source('convert.r')
#source('grafikai.r')
#source('UR & Coint tests.r')
