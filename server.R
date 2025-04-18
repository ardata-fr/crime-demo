shinyServer(function(input, output, session) {
  selected_state <- reactive({
    input$plot_selected
  })
  output$console <- renderPrint({
    input$plot_hovered
  })

  output$plot <- renderGirafe({
    x <- girafe(
      code = print(gg_crime),
      width_svg = 6,
      height_svg = 5,
      options = list(
        opts_hover(
          css = "fill:#FF3333;stroke:black;cursor:pointer;",
          reactive = TRUE
        ),
        opts_selection(
          type = "multiple",
          css = "fill:#FF3333;stroke:black;"
        )
      ),
      dependencies = list(
        gfontHtmlDependency(family = "Ms Madi")
      )
    )
    x
  })

  observeEvent(input$reset, {
    session$sendCustomMessage(type = 'plot_set', message = character(0))
  })

  output$datatab <- renderTable({
    out <- crimes[crimes$state %in% selected_state(), ]
    if (nrow(out) < 1) return(NULL)
    row.names(out) <- NULL
    out
  })
})
