# Developing Data Products - Course Project - Shiny App

# server.R

library(shiny)

calcBMI <- function(h, w) w*703/(h*h)

calcRMR <- function(h, w, s, a) (10*w/2.20462 + 6.25*h*2.54 - 5*a + 5 - 166*as.numeric(s))

calcPAL <- function(p) (0.25 + 0.3*as.numeric(p))

shinyServer(
    function(input, output) {
        output$oBMI <- renderPrint({calcBMI(input$height, input$weight)})
        cRMR <- reactive(calcRMR(input$height, input$weight, input$sex, input$age))
        output$oRMR <- renderPrint({cRMR()})
        cPAL <- reactive(calcPAL(input$pal) * cRMR())
        output$oPAL <- renderPrint({cPAL()})
        output$oConsume <- renderPrint({input$consume})
        cDiff <- reactive(input$consume - cRMR() - cPAL())
        output$oDiff <- renderPrint({cDiff()})
        cChg <- reactive((7*cDiff())/3500)
        output$oChg <- renderPrint({cChg()})
    }
)
