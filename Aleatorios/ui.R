#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(kableExtra)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Generacion de numeros aleatorios - Metodo congruencial"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("semilla",
                        "Ingrese un valor inicial:",
                        min = 1,
                        max = 50,
                        value = 30),
            # usar numericInput
            sliderInput("divisor",
                        "Ingrese el valor de m:",
                        min = 1,
                        max = 50,
                        value = 30),
            sliderInput("constante",
                        "Ingrese el valor de a:",
                        min = 1,
                        max = 50,
                        value = 30),
            sliderInput("num",
                        "Cantidad de numeros a generar:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("tabla")
        )
    )
)
