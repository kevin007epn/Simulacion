#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(tidyverse)

# Carga de datos
load("./data/Info.RData")

# Ajuste de formato fecha
datos[, fecha_corte:=ymd(fecha_corte)]
datos[, fecha_nacimiento:=ymd(fecha_nacimiento)]

# Define server logic required to draw a histogram
function(input, output, session) {

  # Filtro de variables por su tipo
  tvar <- datos |> map_chr(class)
  tvar <- data.table(Variable = names(tvar), Tipo = unname(tvar))
  #var_num <- datos[, names(tvar[tvar == "numeric"]), with = FALSE]
  #var_chr <- datos[,names(tvar[tvar == "character"]), with = FALSE]
  
  observe({
    updateSelectInput(session, "var", choices = tvar[Tipo == input$tipo])
  })
  
    output$resumen <- renderPrint({
      datos %>% dplyr::select(input$var) %>% summary(.)
    })
    
    output$grafico <- renderPlot({
      if(input$tipo == "numeric"){
        #datos %>% dplyr::select(input$var) %>% unlist() %>% hist(.)
        datos %>% dplyr::select(input$var) %>% pull(.) %>% hist(.)
      } else {
        datos %>% dplyr::select(input$var) %>% table(.) %>% barplot(.)
      }
    })
    #output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = 11)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = "green", border = "red",
             #xlab = 'Tiempo', main = 'Primer histograma')

    #})

}
