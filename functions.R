library(quantmod)
library(zoo)
library(tseries)
library(PerformanceAnalytics)

read.etf.file<-function() {
  f <- sprintf("%s%s",dirPrepend,"etf.csv")
  p1<-read.csv(f,header=TRUE,sep=",",stringsAsFactors=FALSE)
  rownames(p1) <- p1[,1]
  return(p1)
}

calcPerformance <- function (etf,startdate,enddate) {
    p <- etf.parameters
    if (etf=="none") 
        etf <- etf.default
    adjPrice <- get.hist.quote(instrument = etf,startdate, enddate,
                               provider = c("yahoo"),retclass=c("zoo"),
                               quote = c("AdjClose"),
                               compression = "w",
                               quiet = TRUE)
    return(adjPrice)
}
