convert.sum=function(x, newFr = 4)
{
  i=1
  j=1
  k=c()
  while (i<length(x))
  {
    k[j]=sum(x[i],x[i+1],x[i+2])
    i=i+3
    j=j+1
  }
  
  k <- ts(k, start = start(x), frequency = newFr)
  return(k)
}

convert.mean=function(x, newFr = 4)
{
  i=1
  j=1
  k=c()
  while (i<length(x))
  {
    k[j]=sum(x[i],x[i+1],x[i+2])/3
    i=i+3
    j=j+1
  }
  
  k <- ts(k, start = start(x), frequency = newFr)
  return(k)
}

convert.last=function(x, newFr = 4)
{
  i=1
  j=1
  k=c()
  while (i<length(x))
  {
    k[j]=x[i+2]
    i=i+3
    j=j+1
  }
  
  k <- ts(k, start = start(x), frequency = newFr)
  return(k)
}