#loading library
library(shiny)

#user interface
ui <- fluidPage(
  h1("h1 Header"), 
  h2("h1 Header"), 
  h3("h1 Header"), 
  h4("h1 Header"), 
  h5("h1 Header"), 
  h6("h1 Header"), 
  p("This is a HTML Paragraph"),
  em("This is a text in italics"),
)

#server
server <- function(input, output, session){}
  
#running app
shinyApp(ui, server)

