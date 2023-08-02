#server
library(shiny)


#creating UI
ui <- fluidPage(
#numeric input
  numericInput("count","Number of Values", value=10),
  
#textoutput
  textOutput("trackCount")
)

#server to render text from inputId to outputId 
server <- function(input, output, session){
  output$trackCount <- renderText({
    paste0("Your count is ", input$count)
  })
}

#running app
shinyApp(ui, server)
