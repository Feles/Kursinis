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
VKI     <- ts(read.csv2('data/VKI K.csv'     ), start = 1991      , frequency = 4)
OIL_usd <- ts(read.csv2('data/OIL K.csv'     ), start = 1990      , frequency = 4)
usd_ltl <- ts(read.csv2('data/LtlUsd K.csv'  ), start = c(1993, 3), frequency = 4)
#vds     <- window(ts(read.csv2('data/VDS K.csv'   ), start = 2001, frequency = 4      ),start = 2002, end = c(2011, 2), freq = 4)
NED     <- ts(read.csv2('data/Nedarbas K.csv'), start = c(2001, 4), frequency = 4)
LIBOR   <- ts(read.csv2('data/LIBOR K.csv')   , start = 2001      , frequency = 4)
PK      <- ts(read.csv2('data/PK K.csv')      , start = 2001      , frequency = 4)


OIL <- OIL_usd *usd_ltl
INF <- diff(log(VKI))

colnames(INF) <- 'Infiliacija '
colnames(OIL) <- 'Naftos kaina LTL-BRL'
colnames(NED) <- 'Nedarbo lygis Lietuvoje'

# inf   <- window(INF        ,start = c(2001, 4), end = c(2011, 2))
vki   <- window(log(VKI)   ,start = c(2001, 4), end = c(2011, 2))
oil   <- window(log(OIL)   ,start = c(2001, 4), end = c(2011, 2))
ned   <- window(log(NED)   ,start = c(2001, 4), end = c(2011, 2))
libor <- window(log(LIBOR) ,start = c(2001, 4), end = c(2011, 2))

# inf.m   <- window(INF        ,start = c(2001, 4), end = c(2010, 2))
oil.m   <- window(log(OIL)   ,start = c(2001, 4), end = c(2010, 2))
ned.m   <- window(log(OIL)   ,start = c(2001, 4), end = c(2010, 2))
vki.m   <- window(log(VKI)   ,start = c(2001, 4), end = c(2010, 2))
libor.m <- window(log(LIBOR) ,start = c(2001, 4), end = c(2010, 2))

# INF   <- window(INF   ,start = c(2001, 4), end = c(2011, 2))
OIL   <- window(OIL   ,start = c(2001, 4), end = c(2011, 2))
NED   <- window(NED   ,start = c(2001, 4), end = c(2011, 2))
LIBOR <- window(LIBOR ,start = c(2001, 4), end = c(2011, 2))
VKI   <- window(VKI   ,start = c(2001, 4), end = c(2011, 2))




# Data.m  <- cbind(vki.m,  log(oil.m),  log(ned.m),  log(libor.m))
# Data.mm <- cbind(inf.mm, dlog(oil.mm), dlog(ned.mm), dlog(libor.mm))

# dimnames(Data)[[2]]   <- c('$\\text{inf}_t$', '$\\Delta\\text{oil}_t$', '$\\Delta\\text{ned}_t$', '$\\Delta\\text{libor}_t$')
# dimnames(Data.m)[[2]] <- c('$\\text{inf}_t$', '$\\Delta\\text{oil}_t$', '$\\Delta\\text{ned}_t$', '$\\Delta\\text{libor}_t$')

#Pradedame analizæ:

#source('UR & Coint tests.r')
source('Single eq.r')
source('grafikai V2.r')
