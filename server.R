# Define server logic required to summarize and view the 
# selected dataset
library(reshape2)
library(ggplot2)
library(xtable)

shinyServer(function(input, output) {
  setGlobalVariables()
  
  
  output$show.etf.parameters <- renderUI({ 
    
    list(
      
      
      dateRangeInput("dates", strong("Date range: "),start="2014-01-01", end=date())                     
      ,selectInput("etf.1", strong("Choose ETF #1:"), choices = etf.labels,selected=1)
      ,selectInput("etf.2", strong("Choose ETF #2:"), choices = etf.labels,selected=1)
      ,selectInput("etf.3", strong("Choose ETF #3:"), choices = etf.labels,selected=1)
      ,selectInput("etf.4", strong("Choose ETF #4:"), choices = etf.labels,selected=1)
    )
    
    
  })
  
  
  output$etf.plot1 <- renderPlot({
    input$calc
    
    if (plotOn) {
      first <- TRUE
      for (t.etf in list.etfs) {
        prices <- calcPerformance(t.etf,input$dates[1],input$dates[2])
        #ma <- SMA(prices,4)
        p <- coredata(prices)
        p <- 100*p/p[1]              
        if (first) {      
          df.etfs <<- data.frame(time=index(prices),p,etf=as.factor(t.etf))
          #df.ma <<- data.frame(time=index(ma),ma=coredata(ma),etf=as.factor(etf))
          first <- FALSE
        } else {
          df.etfs <<- rbind(df.etfs,data.frame(time=index(prices),p,etf=as.factor(t.etf)) )
          #df.ma <<- rbind(df.ma,data.frame(time=index(ma),ma=coredata(ma),etf=as.factor(etf)))
        }
        
      }
      ggplot(df.etfs,aes(x=time,y=AdjClose,colour=etf))+geom_line()+ylab("Percent Change")
      #ggplot(df.ma,aes(x=time,y=ma,colour=etf))+geom_line()+ylab("MA")
    }
    
    
  })
  
  output$etf.plot2 <- renderPlot({
    input$graph
    
    if (plotOn) {
      first <- TRUE
      for (t.etf in list.etfs) {
        p <- coredata(prices)     
        if (first) {      
          df.etfs <<- data.frame(time=index(prices),p,etf=as.factor(t.etf))
          
          first <- FALSE
        } else {
          df.etfs <<- rbind(df.etfs,data.frame(time=index(prices),p,etf=as.factor(t.etf)) )
          
        }
        
      }
      
      ggplot(df.etfs,aes(x=time,y=AdjClose))+geom_line()+ylab("Price per Share")+facet_grid(etf~.,scales="free_y")
      
    }
  })
  
  output$etf.table <- renderTable({
    input$table # this is a button in ui.R        
    if (plotOn) {
      first <- TRUE
      for (t.etf in list.etfs) {
        prices <- calcPerformance(t.etf,input$dates[1],input$dates[2])
        p <- coredata(prices) 
        colnames(p) <- t.etf
        t <- as.character(index(prices))
        if (first) {      
          df.etfs <<- data.frame(date=t,p)
          first <- FALSE
        } else {
          df.etfs <<- cbind(df.etfs,p )
        }
        
      }            
      df.etfs
    }        
  })
  
  
  observe ( {
    input$etf.1
    input$etf.2
    input$etf.3
    input$etf.4
    list.etfs <<- c()
    if (!is.null(input$etf.1) )
      if (input$etf.1 != "none:selected")
      {
        list.etfs <<- c(list.etfs,strsplit(input$etf.1,":")[[1]][1])
        plotOn <<- TRUE                            
      }
    
    if (!is.null(input$etf.2) )
      if (input$etf.2 != "none:selected")
      {
        list.etfs <<- c(list.etfs,strsplit(input$etf.2,":")[[1]][1])
        plotOn <<- TRUE     
      }
    
    if (!is.null(input$etf.3) )
      if (input$etf.3 != "none:selected")
      {
        list.etfs <<- c(list.etfs,strsplit(input$etf.3,":")[[1]][1])
        plotOn <<- TRUE           
      }
    
    if (!is.null(input$etf.4) )
      if (input$etf.4 != "none:selected")
      {
        list.etfs <<- c(list.etfs,strsplit(input$etf.4,":")[[1]][1])
        plotOn <<- TRUE             
      }
    
    
  })
  
})
