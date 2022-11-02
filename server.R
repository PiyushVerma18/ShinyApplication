library(shiny)
library(datasets)
library(rsconnect)
library(ggplot2)

DiamondData <- diamonds

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("price ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("price ~", "(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=diamonds)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$DiamondboxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = diamonds,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$diamondPlot <- renderPlot({
    with(DiamondData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})