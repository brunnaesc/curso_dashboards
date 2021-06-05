# Meu primeiro shiny app
#
# Faça um shiny app para visualizar histogramas da base diamonds
# e o coloque no shinyapps.io.
#
# Seu shiny deve ter um input e um output.
#
# - Input: variáveis numéricas da base diamonds.
# - Output: histograma da variável selecionada.
#
# Para acessar a base diamonds, carrrege o pacote ggplot2
#
# library(ggplto2)
#
# ou rode
#
# ggplot2::diamonds


library(ggplot2)
library(tidyverse)
library(shiny)


ui <- fluidPage(
  "histograms - diamonds DB <U+0001F48E>",
  selectInput(
    inputId = "var",
    label = "Select:",
    choices = diamonds %>%
      select(where(is.numeric)) %>%
      names()
  ),
  plotOutput("histogram")
)

server <- function(input, output, session) {
  output$histogram <- renderPlot({
    hist(diamonds[[input$var]])
  })
}

shinyApp(ui, server)
