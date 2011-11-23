VARselect(Data.m, lag.max = 8, type = "both")
H2 <- ca.jo(Data.m, ecdet = "trend", K = 2)
#summary(H2)
VEC2 <- cajools(H2)
#summary(VEC2)
VAR2 <- vec2var(H2, r = 1)
#print(VAR2)
prediction <- predict(VAR2, n.ahead = 4)
#plot(prediction)


#Tables VEC model
vec.coefs <- as.table(round(VEC2$coefficients, 4))
colnames(vec.coefs) <- c('$\\Delta\\text{inf}_t$', '$\\Delta\\text{oil}_t$', '$\\Delta\\text{ned}_t$', '$\\Delta\\text{libor}_t$')
rownames(vec.coefs) <- c('Konstanta', '$\\Delta\\text{inf}_{t-1}$',  '$\\Delta\\text{oil}_{t-1}$', '$\\Delta\\text{ned}_{t-1}$',  '$\\Delta\\text{libor}_{t-1}$','$\\Delta\\text{inf}_{t-2}$',  '$\\Delta\\text{oil}_{t-2}$', '$\\Delta\\text{ned}_{t-2}$',  '$\\Delta\\text{libor}_{t-2}$', 'Laikas')
latex(vec.coefs, file = "LaTeX\\VEC")

#Tables VAR model
var.coefs <- as.table(round(rbind(t(as.matrix(VAR2$deterministic)),t(as.matrix(VAR2$A$A1)), t(as.matrix(VAR2$A$A2))), 4))
colnames(var.coefs) <- c('$\\text{inf}_t$', '$\\text{oil}_t$', '$\\text{ned}_t$', '$\\text{libor}_t$')
rownames(var.coefs) <- c('Konstanta', 'Laikas', '$\\text{inf}_{t-1}$',  '$\\text{oil}_{t-1}$', '$\\text{ned}_{t-1}$',  '$\\text{libor}_{t-1}$','$\\text{inf}_{t-2}$',  '$\\text{oil}_{t-2}$', '$\\text{ned}_{t-2}$',  '$\\text{libor}_{t-2}$')
latex(var.coefs, file = "LaTeX\\VAR")