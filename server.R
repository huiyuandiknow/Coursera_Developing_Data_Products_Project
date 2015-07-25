library(shiny)
library(stats)

shinyServer(function(input, output ) {
  
  # download data from the web
  data <- read.csv("http://www.instantr.com/wp-content/uploads/2013/01/europe.csv")

  # get a reactive radiobutton for clustering method
  distType <- reactive({
    switch(input$dist,
           "Euclidean" = "euclidean",
           "Manhattan" = "manhattan")
    })
 
  methodType <- reactive({
    switch(input$method, 
           "Single Linkage" = "single",
           "Complete Linkage" = "complete",
           "Average Linkage" = "average",
           "Ward's Minimum Variance" = "ward.D2")
  })
  
  # fit the hierarchical model and return the plot with 
  # number of clusters specified
  output$plot <- renderPlot({
    euroclust <- hclust(dist(data[-1], method=distType()), method= methodType())
    plot(euroclust, labels = data$Country, cex=1.5, 
         xlab="European Countries")
    rect.hclust(euroclust, input$clusters)
    })
})
