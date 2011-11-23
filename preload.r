#Panaikiname visus kintamuosius ið praetø sesijø
rm(list = ls(all.names = TRUE))

#Nustatome darbinæ direktorijà
setwd('../Kursinis')

#Prijungiame rikalingus paketus
library(tsDyn)
library(forecast)
library(tseries)
library(xtable)
library(pastecs)
library(urca)
library(dynlm)
library(vars)
library(quantreg)

#Nusiskaitome duomenis 
vki     <- ts(read.csv2('data/VKI K.csv'     ), start = 1991      , frequency = 4)
oil_usd <- ts(read.csv2('data/OIL K.csv'     ), start = 1990      , frequency = 4)
usd_ltl <- ts(read.csv2('data/LtlUsd K.csv'  ), start = c(1993, 3), frequency = 4)
#vds     <- window(ts(read.csv2('data/VDS K.csv'   ), start = 2001, frequency = 4      ),start = 2002, end = c(2011, 2), freq = 4)
ned     <- ts(read.csv2('data/Nedarbas K.csv'), start = c(2001, 4), frequency = 4)
libor   <- ts(read.csv2('data/LIBOR K.csv')   , start = 2001      , frequency = 4)
pk      <- ts(read.csv2('data/PK K.csv')      , start = 2001      , frequency = 4)


oil <- oil_usd *usd_ltl
inf <- diff(log(vki))*100

colnames(inf) <- 'Infiliacija '
colnames(oil) <- 'Naftos kaina LTL-BRL'
colnames(ned) <- 'Nedarbo lygis Lietuvoje'

inf.m   <- window(inf   ,start = c(2001, 4), end = c(2011, 2))
oil.m   <- window(oil   ,start = c(2001, 4), end = c(2011, 2))
ned.m   <- window(ned   ,start = c(2001, 4), end = c(2011, 2))
libor.m <- window(libor ,start = c(2001, 4), end = c(2011, 2))
vki.m   <- window(vki   ,start = c(2001, 4), end = c(2011, 2))


inf.mm   <- window(inf   ,start = c(2001, 4), end = c(2010, 2))
oil.mm   <- window(oil   ,start = c(2001, 4), end = c(2010, 2))
ned.mm   <- window(ned   ,start = c(2001, 4), end = c(2010, 2))
libor.mm <- window(libor ,start = c(2001, 4), end = c(2010, 2))
vki.mm   <- window(vki   ,start = c(2001, 4), end = c(2010, 2))


Data   <- cbind(inf.m,  log(oil.m),  log(ned.m),  log(libor.m))
Data.m <- cbind(inf.mm, log(oil.mm), log(ned.mm), log(libor.mm))

dimnames(Data)[[2]]   <- c('$\\text{inf}_t$', '$\\text{oil}_t$', '$\\text{ned}_t$', '$\\text{libor}_t$')
dimnames(Data.m)[[2]] <- c('$\\text{inf}_t$', '$\\text{oil}_t$', '$\\text{ned}_t$', '$\\text{libor}_t$')

#Pradedame analizæ:

#source('convert.r')
#source('grafikai.r')
#source('UR & Coint tests.r')
source('VAR.r')
source('grafikai V2.r')
