# Xtree

An exercise in animation in R. A difference between alternate and random switching of Xtree lighting.

The basic idea is simple: generate a sequence of Xtree pictures in PNG and join them into an animated GIF using the program ImageMagick.

Install the program [ImageMagick](https://imagemagick.org/script/download.php). 

Setup the working environment
```
> wdir <- "C:/Users/vlado/work/R/anim"
> setwd(wdir)
> # Euclidean distance
> dE <- function(i,j) {d <- c(P$x[i]-P$x[j],P$y[i]-P$y[j])
+   sqrt(crossprod(d,d)[1,1]) }
> # point inside Xtree
> test <- function(x,y) return(3*min(x,10-x) >= y)
```
Initialize the tree T, colors C, and points (pendants) P.
```
> n <- 45; m <- 6; dmin <- 1.1; tmax <- 4000
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
+   r = runif(n,min=3,max=5), 
+   on = sample(c(TRUE,FALSE),n,replace=TRUE),
+   co = sample(1:m,n,replace=TRUE),
+   pc = sample(21:25,n,replace=TRUE)
+ )
```
Generate n random points inside the tree at distance at least dmin.
```
> t <- 0
> for(p in 1:n){
+   while(t < tmax){ t <- t+1
+     x <- runif(1,min=0,max=10); y <- runif(1,min=0,max=15)
+     # cat("new",t,p,x,y,"\n"); flush.console()
+     if(test(x,y)){ P$x[p] <- x; P$y[p] <- y 
+       if(p>1){ OK <- TRUE
+         for(q in 1:(p-1)) if(dE(p,q)<dmin) {OK <- FALSE; break}  
+       } else break
+       if(OK) break
+     }
+   }
+   if(t >= tmax) break
+   pp <- p
+ }
> cat("tries = ",t,pp,"\n"); flush.console()
tries =  1622 45 
> n <- pp
```
Generate a sequence of 40 pictures in PNG with randomly lighted points
```
> par(new = TRUE)
> png(file="Xtree%02d.png", width=480, height=600)
> for(s in 1:40){
+   # cat("picture ",s,"\n"); flush.console()
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
```
Combine the PNG sequence into a single GIF
```
> system("magick -delay 80 *.png XtreeR.gif")
> system("magick -delay 150 *.png XtreeR150.gif")
> system("magick -delay 300 *.png XtreeR300.gif")
```
For switching a given lighting change
```
> # for(s in 1:40){
> for(s in 1:2){
...
+   P$on <- !P$on; 
+   # P$on = sample(c(TRUE,FALSE),n,replace=TRUE)
```
and for bliking
For switching a given lighting change
```
> # for(s in 1:40){
> P$on <- rep(TRUE,n)
> for(s in 1:2){
...
+   P$on <- !P$on; 
+   # P$on = sample(c(TRUE,FALSE),n,replace=TRUE)
```


![XtreeS300](https://github.com/user-attachments/assets/060442b8-8faa-4fa2-8795-b56572dfa0cd)  ![XtreeR300](https://github.com/user-attachments/assets/2bd58707-69d0-46be-9b5b-0a612afd34cc)


![XtreeSc150](https://github.com/user-attachments/assets/f6ddfe9a-60bc-4d24-a8e2-ec10f54cba1b)  ![XtreeRc150](https://github.com/user-attachments/assets/0b34aad9-8d7d-41f5-bc58-a84ccd67043c)

![XtreeB](https://github.com/user-attachments/assets/1a0247fe-b983-48a2-9303-17b0c6766c2c)
