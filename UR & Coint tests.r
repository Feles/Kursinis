VST = function(x, ...)
{
  test <- ur.df(x, ...)
  #print(summary(test))
  result <- round(cbind(test@teststat[1], test@cval[1,2]), 2)
  colnames(result) <- c("Testo statistika", "5% krit. r.")
  
  latex(as.matrix(result), filename = names(x))
  return(result)
}

print(VST(  log(vki.m), lags=5, selectlags="BIC", type = "drift" ))
print(VST(  log(oil.m), lags=5, selectlags="BIC", type = "drift"))
print(VST(  log(ned.m), lags=5, selectlags="BIC", type = "none" ))
print(VST(      inf.m , lags=5, selectlags="BIC", type = "none" ))
print(VST(log(libor.m), lags=5, selectlags="BIC", type = "none" ))
print(VST(   log(pk.m), lags=5, selectlags="BIC", type = "drift"))

