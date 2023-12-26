o <- c("","+","-","*") 

izrazP <- function(s,n){
  if(n==0) {k <<- k+1; v <- eval(str2expression(s))
    if(v==2024) cat(k,s,v,"\n")
  } else for(p in o) izrazP(paste(s,p,n,sep=""),n-1)
}

izrazR <- function(s,n){
  if(n==0) {t <- paste("-",s,sep="")
    k <<- k+1; v <- eval(str2expression(s)); if(v==2024) cat(k,s,v,"\n")
    k <<- k+1; v <- eval(str2expression(t)); if(v==2024) cat(k,t,v,"\n")
  } else for(p in o) izrazR(paste(n,p,s,sep=""),n-1)
}

k <- 0; izrazP("9",8); izrazP("-9",8)
k <- 0; izrazR("9",8)

