#output
#loading library
library(shiny)

#creating ui
ui <- fluidPage(
#rows and columns
  fluidRow(
    column(6,
           textOutput("strOutput"),
           
           )),
  fluidRow(
    column(6,
           tableOutput("tblOutput"),
    )),
  fluidRow(
    column(12,
           plotOutput("pltOutput")
           )
    )
)

#creating server
server <- function(input, output, session){
#rendering text, table and plot
  output$strOutput <- renderText({"I am text from a server"})
  output$tblOutput <- renderTable({head(iris)})
  output$pltOutput <- renderPlot({plot(iris$Sepal.Length, iris$Sepal.Width)})
}

#running shinyApp
shinyApp(ui, server)
