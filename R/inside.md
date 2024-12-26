# Inside triangle


## 'perp dot' product 

```
> `%pDp%` <- function(u,v) return(u[1]*v[2] - u[2]*v[1])
> a <- c(5,2); b <- c(3,4)
> a %pDp% b
[1] 14
```
## Barycentric Algorithm

https://www.sunshine2k.de/coding/java/PointInTriangle/PointInTriangle.html

![inside](https://github.com/user-attachments/assets/efaf6667-712e-4702-a346-20ef5ce54823)

```
> U <- c(1,3); V <- c(5,1); Z <- c(6,7); P <- c(4,2)
> X <- c(4,4); Y <- c(3,6); T <- c(6,5); Q <- c(2,2)
> xy <- rbind(U,V,Z,X,Y,T,P,Q)
> plot(xy,type="n",xlab="",ylab="",xlim=c(0.5,6.5),ylim=c(0.5,7.5))
> polygon(rbind(U,V,Z),col="yellow",border="red",lwd=1)
> points(xy,pch=16,cex=1.5)
> text(xy[,1]+0.2,xy[,2],rownames(xy),cex=1.5)

```

```

```
