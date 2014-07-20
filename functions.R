library(quantmod)
library(zoo)
library(tseries)
library(PerformanceAnalytics)

myPrint <- function (label, data) {
  fDebug <- TRUE
  if (fDebug) {
    print(label)
    print(data)
    print("--------------")
  }
}

#tracePrint <- function (label) {
#   fDebug <- TRUE
#   if (fDebug) {
#     print(sprintf("Executing %s",label))
#   }
#}
selectRow <- function(rowname=rname) {
  return(parameters[parameters$name==rowname,])
}

read.etf.file<-function() {
  f <- sprintf("%s%s",dirPrepend,"etf.csv")
  p1<-read.csv(f,header=TRUE,sep=",",stringsAsFactors=FALSE)
  rownames(p1) <- p1[,1]
  return(p1)
}

calcPerformance <- function (etf) {
    p <- etf.parameters
    if (etf=="none") 
        etf <- p$etf[1]
    start.date <- etf.parameters[etf,"startdate"]
    end.date <- etf.parameters[etf,"enddate"]
    adjPrice <- get.hist.quote(instrument = etf,start.date, end.date,
                               provider = c("yahoo"),retclass=c("zoo"),
                               quote = c("AdjClose"),
                               compression = "w",
                               quiet = TRUE)

    return(adjPrice)
    #p <- data.frame(tm=index(adjPrice),price=melt(adjPrice)$AdjClose)
    

    #   
#   myPrint("prices",prices)
#   
#   initialPrices<-t(data.frame(prices[1,]))
#   myPrint("initialPrices",initialPrices)
#   finalPrices<-t(data.frame(prices[nrow(prices),]))
#   myPrint("finalPrices",finalPrices)
#   
#   
#   # Now we start calculating the info for each asset
#   #   allocated amount, number of shares, final valuation etc.
#   
#   amount <- data.frame(amount*0.01*assetData$percent) # initial dollar allocation
#   shares <- data.frame(amount/initialPrices) # number of shares purchased initially
#   valuations <- data.frame(shares*finalPrices) # final valuations of each asset
#   # TO DO: add or subtract additions and withdrawal
#   finalPercent <- valuations*100/sum(valuations) # resulting final allocation (percent)
#   # create a data frame
#   assetData<-cbind(assetData,amount,initialPrices,shares,finalPrices,valuations,finalPercent)
#   
#   
#   
#   # IMPROVEMENT NEEDED: rounding to integer number of shares goes here, recalc allocation and percent
#   # asset return and Sharpe ratio
#   
#   # returns per month (NA for the first month)
#   returns <- Return.calculate(prices)
#   #myPrint("returns",returns)
#   
#   # Annualized returns for each asset
#   annualizedReturns <- t(100*Return.annualized(returns,scale=xscale))
#   #myPrint("annualizedReturns",annualizedReturns)
#   assetData <- cbind(assetData,annualizedReturns)
#   colnames(assetData) <- c("initialPercent","type","dollars","initialPrices","shares",
#                            "finalPrices","valuation","finalPercent","annualizedReturns")
#   #myPrint("assetData",assetData)
#   #sharpeRatios <- SharpeRatio.annualized(returns,scale=xscale,geometric=TRUE)
#   #myPrint("sharpeRatios",sharpeRatios)
#   
#   # calculate the portfolio time history
#   rShares <- t(shares)
#   rownames(rShares) <- "date"
#   mShares <- data.frame()
#   for (i in 1:nrow(prices)) {
#     mShares <- rbind(mShares,rShares)
#   }
#   colnames(mShares) <- assetList
#   
#   #print(mShares)
#   portfolioPrices <- prices*mShares
#   total <- data.frame(total=rowSums(portfolioPrices))
#   
#   #myPrint("total", total)
#   
#   
#   
#   
#   ts3 <- total
#   totalReturn <- 100*Return.calculate(ts3)
#   #myPrint("totalReturn",totalReturn)
#   annualizedTotalReturn <- 100*Return.annualized(totalReturn/100,scale=xscale)
#   #myPrint("annualizedTotalReturn",annualizedTotalReturn)
#   #portfolioSharpeRatio <- SharpeRatio.annualized(0.01*totalReturn,scale=12,geometric=TRUE)
#   
#   
#   return(list(annualizedTotalReturn,assetData))
}

calculate <- function() {
#   tracePrint("calculate")
#   myPrint("parameters",parameters)
#   perf <- runInvest(selectedPortfolio) # perf is a list
#   pAnnualReturn <<- data.frame(perf[1])
#   #myPrint("pAnnualReturn",pAnnualReturn)
#   pData <- data.frame(perf[2]) 
#   #myPrint("pData",pData)
#   bAnnualReturn <<- data.frame(perf[3])
#   #myPrint("bAnnualReturn",bAnnualReturn)
#   bData <- data.frame(perf[4])
#   #myPrint("bData",bData)
#   
#   
#   
#   #p1 <- data.frame(pData)
#   p1<-subset(pData,select=c(-type))
#   colnames(p1)  <- c("InitialAlloc %","Amount","Buy at","Shares",
#                      "Price","Value","FinalAlloc %","Return %")
#   p2<-as.numeric(p1$Value)
#   assetValue <<- sum(p2)
#   
#   #b1 <- data.frame(bData)
#   b1<-subset(bData,select=c(-type))
#   colnames(b1)  <- c("InitialAlloc %","Amount","Buy at","Shares",
#                      "Price","Value","FinalAlloc %","Return %")
#   b2 <-as.numeric(b1$Value)
#   benchmarkValue <- sum(b2)
#   
#   
#   portfolioDetails <<- p1
#   benchmarkDetails <<- b1
#   
#   p1 <- data.frame(assetValue,pAnnualReturn)
#   colnames(p1) <- c("Value","Return %")
#   rownames(p1) <- "Portfolio"
#   portfolioReturn <<- p1
#   
#   b1 <- data.frame(benchmarkValue,bAnnualReturn)
#   colnames(b1) <- c("Value","Return %")
#   rownames(b1) <- "Benchmark"
#   benchmarkReturn <<- b1  
  
  
}
