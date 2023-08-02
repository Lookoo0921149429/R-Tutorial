#loading library
library(shiny)

#crating user interface
ui <- fluidPage(
  numericInput(inputId="n",
                 "Sample Size", value=25),
  plotOutput(outputId = "hist")
)

#creating server
server <- function(input, output){
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}

#running app
shinyApp(ui=ui, server=server)
