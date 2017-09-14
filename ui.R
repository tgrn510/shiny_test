library(shiny)
library(ggplot2)
library(plotly)
# Define UI for application that plots random distributions
shinyUI(fluidPage(
    mainPanel(
      plotlyOutput("distPlot", height=800)
    )
)
)
