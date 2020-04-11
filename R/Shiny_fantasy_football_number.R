library(tidyverse)
library(shiny)

# Load the NFL data
df = read.csv("top_100_receivers.csv")
df = df %>%
  arrange(df$Player)


# create a shiny for the data

ui <- fluidPage(
  headerPanel("Top 100 players by receptions"),
  sidebarPanel(
    textInput(inputId = "rec1",
                label = "Pick a receiver"),
    selectInput(inputId = "rec2",
                label = "Pick another receiver",
                choices = df$Player)
  ),
  mainPanel(
    tableOutput("table")
  ))



server <- function(input, output) {
  output$table = renderDataTable({
    dataFilter <- subset(df, df$Player == input$rec1
  })
}

shinyApp(ui = ui, server = server)