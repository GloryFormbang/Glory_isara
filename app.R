

library(shiny)
library(rsconnect)

rsconnect::setAccountInfo(name='compte-projet',
                          token='BDF10F4E166CE27E65600E5B3FE3DAFE',
                          secret='v4OsiqUBKxGY6KPhE56i+96BxESUilMdd24jyaPm')


library(tidyverse)
library(readxl)
library(dplyr)

# Charger les données
penguins <- read_excel("peng.xlsx", na = "NA")

# UI
ui <- fluidPage(
  titlePanel("Jeu de données Pinguins"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("bill_len", "Longueur du Bec", min = 5, max = 20, value = 35),
      sliderInput("body_mass", "Masse corporelle", min = 10, max = 25, value = 40)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Server
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # convertir en numérique pour être sûr
    x <- as.numeric(penguins$body_mass)
    y <- as.numeric(penguins$bill_len)
    
    par(mfrow = c(1, 2))  # 2 histogrammes côte à côte
    
    hist(x, breaks = input$body_mass + 1, col = "green",
         main = "Masse corporelle", xlab = "Body Mass (g)")
    
    hist(y, breaks = input$bill_len + 1, col = "blue",
         main = "Longueur du bec", xlab = "Bill Length (mm)")
  })
}

# Run App
shinyApp(ui = ui, server = server)