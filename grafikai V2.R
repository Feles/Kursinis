h = 4
w = 8

# #Prognozes VAR grafikas
# pdf("grafikai//vki_fcast.pdf", width = w, height = h + 0.5 * h)
# plot(Data[,1], xlab = "Metai", ylab = "vki")
# fcast.vki <- ts(c(Data.m[,1], prediction$fcst$X..text.vki._t.[,1]), start = c(2001,4), frequency = 4)
# lines(window(fcast.vki, start = c(2010,2)), lty = 2)
# legend("topleft", c( "Stebëjimai", "Prognozë"), lty = c(1, 2), col = c(1, 1), lwd=c(1.5, 1.5))
# dev.off()

#Atskiri grafikai

pdf("grafikai//Lned.pdf", width = w, height = h)
plot(ned, xlab = "Metai", ylab = "ned")
dev.off()

pdf("grafikai//Loil.pdf", width = w, height = h)
plot(oil, xlab = "Metai", ylab = "oil")
dev.off()

pdf("grafikai//Llibor.pdf", width = w, height = h)
plot(libor, xlab = "Metai", ylab = "libor")
dev.off()

pdf("grafikai//Lvki.pdf", width = w, height = h)
plot(vki, xlab = "Metai", ylab = "vki")
dev.off()

#Bedras realiu duomenu grafikas
pdf("grafikai//All_Data.pdf", width = w, height = h+2)
opar=par(mfrow=c(2,2))
plot(VKI,xlab="Metai",ylab="VKI (VKI = 100, 2005m.)")
plot(OIL, xlab="Metai", ylab="Naftos kaina LTL/BRL")
plot(NED, xlab="Metai", ylab="Nerdarbas Lietuvoje %")
plot(LIBOR, xlab = "Metai", ylab = "LIBOR %")
par(opar)
dev.off()
#Poriniai grafikai
pdf("grafikai//Ldata.pdf", width = w, height = h + 0.5*h)
plot(scale(vki), xlab="Metai", ylab="", ylim=c(-3,3))
lines(scale(oil), lty=2)
lines(scale(ned), lty=3)
lines(scale(libor), lty=4)
legend(2002,3, c("vki", "oil","ned","libor"), col=c(1,1,1,1),lty=c(1,2,3,4))
dev.off()

# pdf("grafikai//inf_oil.pdf", width = w, height = h)
# plot(scale(inf), xlab="laikas", ylab="", ylim=c(-3,3))
# lines(scale(oil), lty=2)
# legend(2002,3, c("inf", "oil"), col=c(1,1),lty=c(1,2))
# dev.off()
# 
# pdf("grafikai//inf_ned.pdf", width = w, height = h)
# plot(scale(inf), xlab="laikas", ylab="", ylim=c(-3,3))
# lines(scale(ned), lty=2)
# legend(2002,3, c("inf", "ned"), col=c(1,1),lty=c(1,2))
# dev.off()
# 
# pdf("grafikai//inf_libor.pdf", width = w, height = h)
# plot(scale(inf), xlab="laikas", ylab="", ylim=c(-3,3))
# lines(scale(libor), lty=2)
# legend(2002,3, c("inf", "libor"), col=c(1,1),lty=c(1,2))
# dev.off()

#Filipso kreive

a = seq(from = 0.2, to = 5, length.out = 1000)
filip = cbind(a + 1, 1/a + 1)


pdf("grafikai\\Filipso.pdf")
plot(filip, xlim = c(0, 7), ylim = c(0, 7),type = "l", main = "Filipso kreivë", xlab = "Nedarbas", ylab = "Infliacija", axes = F)
arrows(0,0,0,7, length = 0.1)
arrows(0,0,7,0, length = 0.1)
dev.off()

#Atskiri skirtumu grafikai

pdf("grafikai//Dned.pdf", width = w, height = h)
plot(diff(ned), xlab = "Metai", ylab = "ned skirtumai")
dev.off()

pdf("grafikai//Doil.pdf", width = w, height = h)
plot(diff(oil), xlab = "Metai", ylab = "oil skirtumai")
dev.off()

pdf("grafikai//Dlibor.pdf", width = w, height = h)
plot(diff(libor), xlab = "Metai", ylab = "libor skirtumai")
dev.off()

pdf("grafikai//Dvki.pdf", width = w, height = h)
plot(diff(vki), xlab = "Metai", ylab = "vki skirtumai")
dev.off()