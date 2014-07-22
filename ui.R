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
              "button to display a table of price history of individual ETFs.",  
              br(),br(),
              tags$a(href="http://rpubs.com/syedtariq/22582", "User Manual")
            ),
            uiOutput("show.etf.parameters")
            ,actionButton("calc", label = h6("All ETFs",align="center"))
            ,actionButton("table", label = h6("Price History",align="center"))
     ),
     column(8,
            h6("Plot showing comparatve performance of selected ETFs",align="center")
            ,plotOutput("etf.plot1")   
            ,h6("Table displaying price history of selected ETFs",align="center")
            ,tableOutput("etf.table")
     )  
   )
   
 )
)
