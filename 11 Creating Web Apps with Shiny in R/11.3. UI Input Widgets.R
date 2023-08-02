library(shiny)

ui <-fluidPage(
  #text input
  textInput(
    inputId = "strInput",
    label = "Text Input",
    value = "demo text"
  ),
  
  #numeric Input
  numericInput(
    inputId = "numInput",
    label = "Numeric Input",
    value = 0,
    step=0.5
  ),
  
  #slider input
  sliderInput(
    inputId = "sliderInput",
    label = "Slider Input",
    min = 0,
    max = 5,
    step = 0.5,
    value = 0
  ),
  
  #date input
  dateInput(
      "date",
      label = h3("Date Input"),
      value = "2002-01-01"
  ),
  
  #date range
  dateRangeInput(
      "dates",
      "Date Range",
      start = "2002-01-01",
      end = "2002-02-01"
      
  ),
  
  #single checkbox
  h5("Single Check box"),
  checkboxInput(
      "checkbox",
      "Show",
      value = TRUE
  ),
  
  #check box group
  checkboxGroupInput(
      "checkGroup",
      "Select your interested course",
      choices = list("Choice 1"=1,
                     "Choice 2"=2,
                     "Choice 3"=3),
      selected = 1
                     
                     ),
  
  #radio buttons
  radioButtons(
      "radio",
      "Are you a robot?",
      choices = list("Yes"=1, "No"=2),
      selected = 2
               ),
  
  #select box
  selectInput(
      "gender",
      "Select your Gender",
      choices = list("Male","Female","Others","Prefer not to say"),
      selected = "Female",
  ),
  
  #helptext
  helpText("Note: help text isn't a true widget,", 
           "but it provides an easy way to add text to",
           "accompany other widgets."),
  
)

server <- function(input, output, session){}

shinyApp(ui, server)
