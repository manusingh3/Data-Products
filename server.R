library(shiny)
library(datasets)
library(rCharts)
library(MASS)
library(nlme)

Petrol <- petrol
datap <- petrol
##datap$No <- factor(datap$No, labels = c("A", "B","C","D"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("Y ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("Y ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=datap)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = datap,
            
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(datap, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2,lwd=3)
    })
  })
  
})
