library(shiny)
library(markdown)

shinyUI(navbarPage("Navigation bar",
                   tabPanel("Clustering Plot",
                            sidebarLayout(
                              sidebarPanel(
                                radioButtons("dist", "Distance Measure:", 
                                             list("Euclidean", "Manhattan")),
                                radioButtons("method", "Agglomerative Clustering Method:",
                                             list("Single Linkage", "Complete Linkage", 
                                                  "Average Linkage", "Ward's Minimum Variance")),
                                numericInput('clusters', 'Number of clusters', 3,
                                             min = 1, max = 9)
                              ),
                              mainPanel(
                                plotOutput("plot"))
                            )),
                   tabPanel("Documentation",
                            includeHTML("ProjectDocumentation.html"))
))
