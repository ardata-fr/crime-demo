shinyUI(fluidPage(
  fluidRow(
    column(
      width = 10,
      girafeOutput("plot", width = NULL, height = NULL),
      h4("Selected states"),
      tableOutput("datatab")
    ),
    column(
      width = 2,
      h4("Hovering states"),
      verbatimTextOutput("console"),
      actionButton("reset", label = "Reset selection")
    )
  )
))
