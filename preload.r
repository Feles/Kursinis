#Panaikiname visus kintamuosius ið praetø sesijø
rm(list = ls(all.names = TRUE))

#Nustatome darbinæ direktorijà
setwd('../Kursinis')

#Prijungiame rikalingus paketus
library(forecast)
library(tseries)
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


oil <- oil_usd *usd_ltl
ulc <- Alga / BVP

colnames(vki) <- 'Vartotojø kainø indeksas'
colnames(oil) <- 'Naftos kaina LTL/BRL'


#Pradedame analizæ:

#source('grafikai.r')
#source('UR & Coint tests.r')
