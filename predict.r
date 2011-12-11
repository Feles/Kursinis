d2i <- function(obj, date){return(which(time(obj)==date))}

prediction <- function(vki.m, e, Dned, Doil, Dlibor, n = 4, mod)
{
  x    <- c()
  cf   <- mod$coefficients
  strt <- end(vki.m)[1] + (end(vki.m)[2]-1)/frequency(vki.m)
  
  for(i in 1:n)
  {
    x[i] <- cf[1]*e[d2i(e, strt + i/4)-1] + 
            cf[2]*Doil[d2i(Doil, strt + i/4)] +
            cf[3]*Doil[d2i(Doil, strt + i/4)-1] +
            cf[4]*Doil[d2i(Doil, strt + i/4)-2] +
            cf[5]*Doil[d2i(Doil, strt + i/4)-3] +
            cf[6]*Doil[d2i(Doil, strt + i/4)-4] +
            cf[7]*Dned[d2i(Dned, strt + i/4)] +
            cf[8]*Dned[d2i(Dned, strt + i/4)-4] +
            cf[9]*Dlibor[d2i(Dlibor, strt + i/4)-2]            
  }
  
  return(ts(x, start = end(vki.m) + c(0,1), frequency = 4))
}
