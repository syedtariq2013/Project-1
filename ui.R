library(shiny)
source("global.R")

shinyUI
(fluidPage
 (
   titlePanel(h2("ETF Performance Comparison",align="center")),
   
   
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
              strong("All ETFs"),
              "button to plot comparative performance.",
              br(),br(),
              "Click on",
              strong("Time History"),
              "button to display a table of time history of individual ETFs.",  
              br(),br(),
              tags$a(href="http://rpubs.com/syedtariq/22582", "User Manual")
            ),
            uiOutput("show.etf.parameters")
            ,actionButton("calc", label = h6("All ETFs",align="center"))
            ,actionButton("table", label = h6("Time History",align="center"))
     ),
     column(8,
            plotOutput("etf.plot1")            
            ,tableOutput("etf.table")
     )  
   )
   
 )
)
