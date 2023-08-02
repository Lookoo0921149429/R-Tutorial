#layout and themes
ui<- fluidPage(
  titlePanel(
    title = "This is a demo",
    windowTitle = "This is a demo App"
    ),
  sidebarLayout(
    sidebarPanel(
      h3("This is a side bar panel")
    ),
    mainPanel(
      h3("This is main panel for outputs")
    )
    
  )
)

server <- function(input,output, session){}

shinyApp(ui, server)
