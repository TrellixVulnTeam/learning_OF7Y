library(shiny)

ui <- fluidPage("Fun Shiny App",
                textInput(inputId = "text", placeholder = "italics(Enter name here)")
  
)


server <- function(input, output) {}


shinyApp(ui = ui, server = server)