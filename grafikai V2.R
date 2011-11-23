#Prognozes VAR grafikas
pdf("grafikai//inf_fcast.pdf", width = 8, height = 6)
plot(Data[,1], xlab = "Metai", ylab = "Infliacija proc.")
fcast.inf <- ts(c(Data.m[,1], prediction$fcst$X..text.inf._t.[,1]), start = c(2001,4), frequency = 4)
lines(window(fcast.inf, start = c(2010,3)), lty = 2)
abline(h = 0, lty = 3)
legend("topleft", c( "Stebëjimai", "Prognozë"), lty = c(1, 2), col = c(1, 1), lwd=c(1.5, 1.5))
dev.off()

#Atskiri grafikai
pdf("grafikai//inf.pdf", width = 8, height = 6)
plot(inf.m, xlab = "Metai", ylab = "Infliacija %")
abline(h = 0, lty = 3)
dev.off()

pdf("grafikai//Lned.pdf", width = 8, height = 6)
plot(log(ned.m), xlab = "Metai", ylab = "ned")
dev.off()

pdf("grafikai//Loil.pdf", width = 8, height = 6)
plot(log(oil.m), xlab = "Metai", ylab = "oil")
dev.off()

pdf("grafikai//Llibor.pdf", width = 8, height = 6)
plot(log(libor.m), xlab = "Metai", ylab = "libor")
dev.off()

pdf("grafikai//Lvki.pdf", width = 8, height = 6)
plot(vki.m, xlab = "Metai", ylab = "vki")
dev.off()

#Bedras realiu duomenu grafikas
pdf("grafikai//All_Data.pdf", width = 8, height = 6)
opar=par(mfrow=c(3,2))
plot(vki.m,xlab="laikas",ylab="VKI")
plot(oil.m, xlab="laikas", ylab="Naftos kaina litais")
plot(ned.m, xlab="laikas", ylab="Nedarbo lygis %")
plot(inf.m, xlab="laikas", ylab="Infliacija %")
abline(h = 0, lty = 3)
plot(libor.m, xlab = "Metai", ylab = "LIBOR %")
par(opar)
dev.off()
#Poriniai grafikai
pdf("grafikai//Ldata.pdf", width = 8, height = 6)
plot(scale(inf.m), xlab="Metai", ylab="", ylim=c(-3,3))
lines(scale(log(oil.m)), lty=2)
lines(scale(log(ned.m)), lty=3)
lines(scale(log(libor.m)), lty=4)
legend(2002,3, c("inf", "oil","ned","libor"), col=c(1,1,1,1),lty=c(1,2,3,4))
dev.off()

pdf("grafikai//inf_oil.pdf", width = 8, height = 6)
plot(scale(inf.m), xlab="laikas", ylab="", ylim=c(-3,3))
lines(scale(log(oil.m)), lty=2)
legend(2002,3, c("inf", "oil"), col=c(1,1),lty=c(1,2))
dev.off()

pdf("grafikai//inf_ned.pdf", width = 8, height = 6)
plot(scale(inf.m), xlab="laikas", ylab="", ylim=c(-3,3))
lines(scale(log(ned.m)), lty=2)
legend(2002,3, c("inf", "ned"), col=c(1,1),lty=c(1,2))
dev.off()

pdf("grafikai//inf_libor.pdf", width = 8, height = 6)
plot(scale(inf.m), xlab="laikas", ylab="", ylim=c(-3,3))
lines(scale(log(ned.m)), lty=2)
legend(2002,3, c("inf", "libor"), col=c(1,1),lty=c(1,2))
dev.off()

#Filipso kreive

a = seq(from = 0.2, to = 5, length.out = 1000)
filip = cbind(a + 1, 1/a + 1)


pdf("grafikai\\Filipso.pdf")
plot(filip, xlim = c(0, 7), ylim = c(0, 7),type = "l", main = "Filipso kreivë", xlab = "Nedarbas", ylab = "Infliacija", axes = F)
arrows(0,0,0,7, length = 0.1)
arrows(0,0,7,0, length = 0.1)
dev.off()