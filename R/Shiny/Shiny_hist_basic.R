library(shiny)

ui <- fluidPage("Histogram Fun!",
                sliderInput(inputId = "num",
                            label = "Choose a Number",
                            value = 25, min = 1, max = 100),
                            plotOutput("hist"))


server <- function(input, output) {
  output$hist <- renderPlot({ 
    hist(rnorm(input$num), 
         col = "Purple", 
         xlab = "Observations", 
         ylab = "Frequency", 
         main = input$num,
         border = "Black")
  })
}


shinyApp(ui = ui, server = server)