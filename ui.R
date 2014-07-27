library(shiny)
source("global.R")

shinyUI
(fluidPage
 (
   titlePanel(h2("ETF Performance Comparison",align="center")),
   
   
   fluidRow(
     column(5,class="well",
            helpText(
              h6("Purpose"),
              "Program allows an investor anticipating purchase of an Exchange Traded Fund (ETF) to compare it against other ETFs
              and against a market index benchmark before making a decision.",
              
              h6("Instructions"),
              "1. Select",
              strong("start"), 
              "and",
              strong("end"),"dates.",
              br(),
              "2. Select up to 4 ETFs to be compared.",
              br(),
              "3. Click on",
              strong("All ETFs"),
              "button to plot comparative performance.",
              br(),
              "4. Click on",
              strong("Price History"),
              "button to display a table of price history of individual ETFs.",  
              br(),br(),"For more details, click:",
              tags$a(href="http://rpubs.com/syedtariq/22582", "User Manual")
            ),
            uiOutput("show.etf.parameters")
            ,actionButton("calc", label = h6("All ETFs",align="center"))
            ,actionButton("table", label = h6("Price History",align="center"))
     ),
     column(7,
            h6("Plot showing comparatve performance of selected ETFs",align="center")
            ,plotOutput("etf.plot1")   
            ,h6("Table displaying price history of selected ETFs",align="center")
            ,tableOutput("etf.table")
     )  
   )
   
 )
)
