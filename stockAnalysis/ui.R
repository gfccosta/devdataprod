source('common.R')

# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Exploratory Stock Analysis"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            h2("Data Explorer"),
            selectInput("stockSymb", label = h4("Stock Selection"), 
                        choices = stockList, selected = 1),
            sliderInput("days",
                        "Window size, in days:",
                        min = 30,
                        max = 360,
                        value = 30),
            h4("Aditional Information"),
            checkboxInput("vo", label = "Add Volume", value = FALSE),
            checkboxInput("BBands", label = "Add Bollinger Bands", value = FALSE),
            checkboxInput("CCI", label = "Add Commodity Channel Index", value = FALSE)
        ),
        
        # Show a plot
        mainPanel(
            plotOutput("stockPlot")
        )
    )
))