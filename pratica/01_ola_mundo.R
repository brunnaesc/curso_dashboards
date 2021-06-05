library(shiny)


# conteúdo da UI é um HTML

ui <- fluidPage(
  "Olá, mundo!"
)


# input = lista
# output = lista

server <- function(input, output, session) {
  # código em R
}

shinyApp(ui, server)