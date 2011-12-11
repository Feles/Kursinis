lm.vki.m <- dynlm(vki.m ~ 1 + libor.m + ned.m + oil.m)
summary(lm.vki.m)
e <- lm.vki.m$res

lm.Dvki.m <- dynlm(d(vki.m) ~ -1 + L(e) + L(d(oil.m), 0:4) + L(d(ned.m), c(0,4)) + L(d(libor.m),2))
summary(lm.Dvki.m)

plot(diff(vki.m))
lines(fitted(lm.Dvki.m), col=2, lty=3)