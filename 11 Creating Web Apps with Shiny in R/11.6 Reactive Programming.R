#reactive programming

#loading library
library(shiny)

#creating user interface
ui <- fluidPage(
  numericInput("age","What is your age ?", value=24),
  
  h3("Hello !!"),
  textOutput("result")
)

#server 
server <- function(input, output, session){
#chaning output when value in input changes (reactive)
  output$result <- renderText({
    if(input$age>=18){
      paste0("You are eligile to vote")
    }else{
      paste0("You are not eligible to vote")
    }
  })
}

#running app
shinyApp(ui, server)
