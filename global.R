source("functions.R")

setGlobalVariables <- function() {

  dirPrepend <<- "./csvFiles/"
  etf.parameters <<- read.etf.file()
  etfs <- etf.parameters$etf
  etf.descriptions <- etf.parameters$description
  etf.labels <<- cbind("none",etfs)
  plotOn <<- FALSE
  df.etfs <<- data.frame()
  return(etf.parameters)
  
}
