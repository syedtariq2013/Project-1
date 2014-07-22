source("functions.R")

setGlobalVariables <- function() {

  dirPrepend <<- "./csvFiles/"
  etf.parameters <<- read.etf.file()
  etfs <<- strsplit(etf.parameters$etf.labels,":")[[1]][1]
  etf.default <<- etfs[1]
  etf.labels <<- cbind("none:selected",etf.parameters$etf.labels)
  etf.list <<- data.frame(etfs=etfs,filled=FALSE)
  plotOn <<- FALSE
  list.etfs <<- c()
  return(etf.parameters)
  
}
