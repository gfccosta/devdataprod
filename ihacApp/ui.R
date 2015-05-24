library(shiny)
require(rCharts)
options(RCHART_LIB = 'nvd3')
options(RCHART_LIB = 'xcharts')
# Define UI for application
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Students application on IHAC (Humanities, Arts and Science Institute"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            h2("Data Explorer"),
            checkboxInput("active", label = "Show only active students", value = FALSE),
            h2("Course Filter"),
            checkboxInput("courseH", label = "Humanities", value = TRUE),
            checkboxInput("courseA", label = "Arts", value = TRUE),
            checkboxInput("courseC", label = "Science and Technology", value = TRUE),
            checkboxInput("courseS", label = "Health", value = TRUE)
        ),
        
        # Show a plot
        mainPanel(
            div(p("Please choose to show the data from only the currenctly active students and the courses avaliable on the Humanities, Arts and Sciences Institute.")),
            tabsetPanel(
                tabPanel("Students aplications", showOutput("chartView1", "nvd3")),
                tabPanel("Ocupation in the classes", showOutput("chartView2", "xcharts")))
        )
    )
))