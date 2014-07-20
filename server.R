# Define server logic required to summarize and view the 
# selected dataset
library(reshape2)
library(ggplot2)

shinyServer(function(input, output) {
  setGlobalVariables()
  
#   output$show.etf.selection <- renderUI({
#     selectInput("current.etf", strong("Choose an ETF:"), choices = etf.labels)
#   })  
  
  
  output$show.etf.parameters <- renderUI({ 
    
    list(
      

      dateRangeInput("dates", strong("Date range: "),start="2014-01-01", end=date())                     
      ,selectInput("etf.1", strong("Choose ETF #1:"), choices = etf.labels,selected=1)
      ,selectInput("etf.2", strong("Choose ETF #2:"), choices = etf.labels,selected=1)
      ,selectInput("etf.3", strong("Choose ETF #3:"), choices = etf.labels,selected=1)
      ,selectInput("etf.4", strong("Choose ETF #4:"), choices = etf.labels,selected=1)
        )
    

  })
  
  
  output$etf.details <- renderPlot({
      input$calc

      if (plotOn) {
          first <- TRUE
          for (etf in list.etfs) {
              prices <- calcPerformance(etf)
              p <- coredata(prices)
              p <- 100*p/p[1]              
              if (first) {      
                df.etfs <<- data.frame(time=index(prices),p,etf=as.factor(etf))
                first <- FALSE
              } else {
                  df.etfs <<- rbind(df.etfs,data.frame(time=index(prices),p,etf=as.factor(etf)) )
              }
              
          }
          ggplot(df.etfs,aes(x=time,y=AdjClose,colour=etf))+geom_line()+ylab(" Percent Change")
      }


  })


  
observe ( {
    input$etf.1
    list.etfs <<- c()
    if (!is.null(input$etf.1) )
        if (input$etf.1 != "none")
        {
            list.etfs <<- c(list.etfs,input$etf.1)
            plotOn <<- TRUE

        }
    if (!is.null(input$etf.2) )
        if (input$etf.2 != "none" ) {
            list.etfs <<- c(list.etfs,input$etf.2)
            plotOn <<- TRUE

        }
    if (!is.null(input$etf.3) )
        if (input$etf.3 != "none" ) {
            list.etfs <<- c(list.etfs,input$etf.3)
            plotOn <<- TRUE

        }
    if (!is.null(input$etf.4) )
        if (input$etf.4 != "none" ) {
            list.etfs <<- c(list.etfs,input$etf.4)
            plotOn <<- TRUE
            
        }
    
    
})
})
