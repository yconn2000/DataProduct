library(shiny)

fluidPage(
  titlePanel(h2("Passenger Cars Fuel Efficiency Preditior", align="center")),
  br(),
  br(),
  sidebarLayout(
    sidebarPanel(


      radioButtons("cylnd", "Number of Cylinders:",
                   c("4 Cyl" = "Four",
                     "6 Cyl" = "Six",
                     "8 Cyl" = "Eight")),
      br(),



      sliderInput("wt", "Weight of the car (pounds):",
                  min = 1000, max = 6000, value = 3000, step = 200, animate = FALSE),

      selectInput("am", label = "Transmission Type",
                  choices = list("Automatic" = "automatic", "Manual" = "manual")),
      br(),
      actionButton("goButton", "Predict!"),
      p("Click the button to find out your car's fuel efficiency.")
    ),

    mainPanel(
      h3("Predicted fuel efficency (MPG):"),
      br(),
      verbatimTextOutput("pred"),
      tags$hr(),
      br(),
      br(),
      h3("Your Input:"),
      br(),
      h4("The weight of your car (lbs):"),
      verbatimTextOutput("wt"),
      h4("Number of Cylindars:"),
      verbatimTextOutput("cylnd"),
      h4("The trasmission of your car:"),
      verbatimTextOutput("am")
    )
  )
)
