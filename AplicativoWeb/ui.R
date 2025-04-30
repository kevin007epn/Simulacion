#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(
    tags$style("h1 {color : #9A9A9A; font-size:35px}"),
    tags$style("h2 {color : #A569BD; font-size:30px}"),
  fluidRow(column(width = 3, tags$img(src = "EPN_logo.png", width = "90px", height = "100px")),
           column(width = 9, h1("Primer aplicativo Simulacion", style = "text-align:center"))),
    # Application title
    #titlePanel("Primer aplicativo Simulacion"),

    # Sidebar with a slider input for number of bins
  #sidebarLayout(
    #sidebarPanel(
      #sliderInput("bins",
                  #"Number of barras:",
                  #min = 1,
                  #max = 50,
                  #value = 10),
      #radioButtons("borde", "Seleccione el color del borde:", c("red", "blue", "orange", "gray", "green", "purple")),
      #radioButtons("rb", "Elija un icono:",
               #choiceNames = list(
                 #icon("file-arrow-down"),
                 #icon("upload"),
                 #icon("cloud")
               #),
               #choiceValues = list("descarga", "carga", "nube")
      #selectInput("color", "Seleccione el color para el gráfico:", c("red", "blue", "orange", "gray", "green", "purple")),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons("tipo", "Seleccione el tipo de variables a analizar:", 
                         choiceNames = c("Cuantitativas", "Cualitativas"),
                         choiceValues = c("numeric", "character"), selected = "numeric"),
            selectInput("var", "Variable seleccionada",
                        choices = tvar$Variable, selected = tvar$Variable[2])
        ),

        #bins: lugar donde se guarda el valor
        #value: valor por defecto
        
        # Show a plot of the generated distribution
        mainPanel(
          h2("Resumen:"),
            verbatimTextOutput("resumen"),
          h2("Gráfico"),
            plotOutput("grafico", width = "350px")
            #plotOutput("distPlot")
        )
    )
)
