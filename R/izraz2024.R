o <- c("","+","-","*"); k <- 0
izraz <- function(s,n){
  if(n==0) {k <<- k+1; v <- eval(str2expression(s))
    if(v==2024) cat(k,s,v,"\n")
  } else for(p in o) {sn <- paste(s,p,n,sep=""); izraz(sn,n-1)}
}
izraz("9",8); izraz("-9",8)
