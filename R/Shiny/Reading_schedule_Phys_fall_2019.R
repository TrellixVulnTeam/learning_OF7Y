library(shiny)
library(tidyverse)


ui <- fluidPage(
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server))


# import the data set
read = read.csv("../../Desktop/Fall_2019/PHYS_2020/Fall 2019 Reading Schedule.csv")
read$X = as.factor(read$X)


# shiny
ui <- fluidPage(
  headerPanel("Fall 2019 Physics Reading Schedule"),
    sidebarPanel(
      selectInput(inputId = "dates",
                  label = "Pick a date",
                  choices = read$X)
    ),
  mainPanel(
    tableOutput("table")
  ))
  


server <- function(input, output) {
  output$table = renderTable({
   dateFilter <- subset(read, read$X == input$dates)
  })
}

shinyApp(ui = ui, server = server)