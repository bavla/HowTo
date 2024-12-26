# Xtree

```
> wdir <- "C:/Users/vlado/work/R/anim"
> setwd(wdir)

> dE <- function(i,j) {d <- c(P$x[i]-P$x[j],P$y[i]-P$y[j])
+   sqrt(crossprod(d,d)[1,1]) }
> test <- function(x,y) return(3*min(x,10-x) >= y)

> n <- 40; m <- 6; dmin <- 1; tmax <- 1000
> T <- cbind(c(0,5,10),c(0,15,0))
> C <- data.frame(
+   li = c("orchid","red","orange","purple","royalblue","cyan"),
+   lo = c("thistle1","lightpink","lightgoldenrod1","plum1","skyblue","lightcyan"),
+   di = c("orchid4","red4","orange4","purple4","royalblue4","cyan4"),
+   do = c("orchid3","red3","orange3","purple3","royalblue3","cyan3")
+ )
> P <- data.frame(
+   x = rep(0,n), 
+   y = rep(0,n), 
+   r = runif(n,min=3,max=6), 
+   on = sample(c(TRUE,FALSE),n,replace=TRUE),
+   co = sample(1:m,n,replace=TRUE)
+ )

> t <- 0
> for(p in 1:n){
+   repeat{ t <- t+1; if(t > tmax) break
+     x <- runif(1,min=0,max=10); y <- runif(1,min=0,max=15)
+     cat("new",t,p,x,y,"\n"); flush.console()
+     if(test(x,y)){ P$x[p] <- x; P$y[p] <- y 
+       if(p>1){ OK <- TRUE
+         for(q in 1:(p-1)) if(dE(p,q)<dmin) {OK <- FALSE; break}  
+       } else break
+       if(OK) break
+     }
+   }
+ }

> par(new = TRUE)

> png(file="Xtree%02d.png", width=480, height=600)
> for(s in 1:40){
+   cat("picture ",s,"\n"); flush.console()
+   plot(T,type="n",xaxt="n",xlab="",yaxt="n",ylab="",bty="n",
+     main="Happy New Year 2025")
+   rect(par("usr")[1],par("usr")[3],par("usr")[2],par("usr")[4],col="midnightblue") # Bg Color
+   polygon(T,col="darkgreen",border="green4",lwd=3)
+   i <- 3 - 2*P$on; ci <- co <- rep(0,n)
+   for(p in 1:n) { q <- P$co[p]; ci[p] <- C[q,i[p]]; co[p] <- C[q,i[p]+1]}
+   points(P$x,P$y,pch=21,cex=P$r,col=co,bg=ci,lwd=4)
+   # P$on <- !P$on; 
+   P$on = sample(c(TRUE,FALSE),n,replace=TRUE)
+   # Sys.sleep(1.5)
+ }
> dev.off()

> system("magick -delay 80 *.png XtreeR.gif")
> system("magick -delay 300 *.png XtreeR300.gif")

```

![XtreeR300](https://github.com/user-attachments/assets/2bd58707-69d0-46be-9b5b-0a612afd34cc)


![XtreeS300](https://github.com/user-attachments/assets/060442b8-8faa-4fa2-8795-b56572dfa0cd)
