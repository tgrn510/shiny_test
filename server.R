
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(plotly)
fv<-read.csv('/srv/shiny-server/crdc/data.csv')
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlotly({
    p<-ggplot(data.frame(fv), aes(X1.x, X2.x, text = paste(Population, Sample))) +   
      theme_bw() +
      ggtitle("CRDC MDS Ancestry Analysis From Genotype Data") + 
      geom_point(aes(colour = Cohort), alpha=0.3,size=3) +    
      geom_point(data=fv[fv$Cohort=="CRDC",],size=3,alpha=0.8,color="DarkGreen")
    ggplotly(p)
  })
})

