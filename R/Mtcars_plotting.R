library(shiny)


data(mtcars)
df = mtcars
df$am = factor(df$am)



ui <- fluidPage(
  pageWithSidebar(
    headerPanel("Plotting MTCARS"), 
    sidebarPanel(
      selectInput(inputId = "x", 
                  label = "X-axis",
                  choices = names(df), 
                  selected = "hp"),
      selectInput(inputId = "y", 
                  label = "Y-axis",
                  choices = names(df),
                  selected = "mpg")
    ),
    mainPanel(
      plotOutput("plot")
      )))
 
 


server <- function(input, output, session) {
# Combine the selected variable into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$x, input$y)]
  })
  output$plot = renderPlot({
    plot(selectedData(), col = "Blue")
  })
}


shinyApp(ui = ui, server = server)