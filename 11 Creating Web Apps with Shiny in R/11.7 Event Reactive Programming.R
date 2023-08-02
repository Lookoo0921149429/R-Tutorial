#loading library
library(shiny)

#creating user interface
ui <- fluidPage(
  h3("Simple Interest Calculator"),
  numericInput("principal", label = "Principal Amount", value=10000),
  numericInput("time", label = "Time in years", value=5),
  numericInput("rate", label = "Rate", value=5.75, step=0.01),
  actionButton("submit","Calculate"),
  
  h3("Simple Interest is"),
  textOutput("simple_interest"),
  
  
)

#server
server <- function(input, output, session){
#event reactive : running server only when buttion is clicked
  si <- eventReactive(input$submit,{
    paste0((input$principal*input$time*input$rate)/100)
  })
 #rendering output
  output$simple_interest <- renderText({
    si()
    })
}

#run app
shinyApp(ui, server)
