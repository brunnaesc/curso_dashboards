# Gráfico de dispersão da base mtcars
#
# Faça um Shiny app para mostrar um gráfico de dispersão (pontos)
# das variáveis da base mtcars.
#
# O seu app deve:
#
#   - Ter dois inputs: a variável a ser colocada no eixo e a variável
#     a ser colocada no eixo y
#
#   - Um output: um gráfico de dispersão

library(shiny)
library(tidyverse)
library(ggplot2)


ui <- fluidPage(
  "mtcars 🚗",
  selectInput(
    inputId = "x",
    label = "Eixo X:",
    choices = mtcars %>%
      names()
  ),
  selectInput(
    inputId = "y",
    label = "Eixo Y:",
    choices = mtcars %>%
      names()
  ),
  plotOutput("point")
)

server <- function(input, output, session) {
  output$point <- renderPlot({

    # # https://stackoverflow.com/questions/35345782/shiny-passing-inputvar-to-aes-in-ggplot2
    # deprecated
    # mtcars %>%
    #   ggplot(aes_string(x = input$x, y = input$y)) +
    #   geom_point
    
    # https://blog.curso-r.com/posts/2019-08-21-nse/
    mtcars %>% 
      ggplot(aes(x = .data[[input$x]], y = .data[[input$y]])) +
               geom_point()
             
  })
}

shinyApp(ui, server)


