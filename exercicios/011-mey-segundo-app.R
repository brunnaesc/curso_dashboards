# Meu segundo shiny app (agora importando uma base de dados)
# 
# Escolha uma das bases da pasta dados ou use uma base própria.
# 
# - Crie um shiny app com pelo menos um input e um output 
# para visualizarmos alguma informação interessante da base.
# 
# - Suba o app para o shinyapps.io.
# 
# Observação: se você usar uma base própria, 
# não se esqueça de descrever as variáveis utilizadas na hora 
# de tirar dúvidas.

library(tidyverse)
library(shiny)

pkmn <- read_rds("dados/pkmn.rds")

ui <- fluidPage(
  "histograms - pokemon DB (╯°□°)╯︵◓"  ,
  
  selectInput(inputId = "var",
              label = "Select:",
              choices = pkmn %>%
                select(altura,
                       peso,
                       hp, 
                       ataque, 
                       defesa, 
                       velocidade) %>% 
                names()),
  
  plotOutput("histogram")
)

server <- function(input, output, session) {
  
  output$histogram <- renderPlot({
    
    hist(pkmn[[input$var]])

  })
}

shinyApp(ui, server)

