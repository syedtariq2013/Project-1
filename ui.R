library(shiny)
source("global.R")

shinyUI
(fluidPage
 (#theme = "bootstrap.min.css",
   headerPanel(h2("ETF Performance Comparison",align="center")),


   fluidRow(
     column(4,class="well",
            helpText(
                h6("Instructions"),
                "Select",
                strong("start"), 
                "and",
                strong("end"),"dates.",
                br(),br(),
                "Select up to 4 ETFs to be compared.",
                br(),br(),
                "Click on",
                strong("Calc"),
                "button to plot comparative performance.",
                hr()
            ),
            #uiOutput("show.etf.selection")
            uiOutput("show.etf.parameters")
            ,actionButton("calc", label = h6("Calc",align="center"))
     ),
     column(8,
            
            #headerPanel(h6("ETF Performance Versus Benchmark"))
            plotOutput("etf.details")            
            #,tableOutput("etf.return")
     )  
   )
   
 )
)
