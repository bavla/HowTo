# point inside triangle / Barycentric Algorithm
# Vladimir Batagelj, 26. dec 2024
# https://www.sunshine2k.de/coding/java/PointInTriangle/PointInTriangle.html 

`%pDp%` <- function(u, v) return(u[1]*v[2] - u[2]*v[1])

# T inside the triangle U, V, Z
in3 <- function(T,U,V,Z){
  w1 <- V-U; w2 <- Z-U; d <- w1 %pDp% w2
  if(d==0) return(NA)
  w <- T-U; s <- (w %pDp% w2)/d; t <- (w1 %pDp% w)/d 
  return((s>=0)&&(t>=0)&&((s+t)<=1))
}


