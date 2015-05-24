## @knitr server.R
library(shiny)
library(rCharts)
options(RCHART_WIDTH = 800)

# Define the server logic
shinyServer(function(input, output) {
    
    ## set the get data to reactive (load only if days change)
    dataInput1 <- reactive({
        ingress <- read.csv('progressFull.csv')
        data <- as.data.frame(ingress)
        
        if(!input$courseH) {
            data <- data[data$course!='Humanities',]
        }
        if(!input$courseA) {
            data <- data[data$course!='Arts',]
        }
        if(!input$courseC) {
            data <- data[data$course!='Science and Technology',]
        }
        if(!input$courseS) {
            data <- data[data$course!='Health',]
        }
        if(input$active) {
            return(data[data$status=='active',])
        } else {
            return(aggregate(count ~ year + course, data, sum))
        }
    })
    
    ## set the get data to reactive (load only if days change)
    dataInput2 <- reactive({
        ingressClasses <- read.csv('progressClassesFull.csv')
        data <- as.data.frame(ingressClasses)
        
        if(!input$courseH) {
            data <- data[data$course!='Humanities',]
        }
        if(!input$courseA) {
            data <- data[data$course!='Arts',]
        }
        if(!input$courseC) {
            data <- data[data$course!='Science and Technology',]
        }
        if(!input$courseS) {
            data <- data[data$course!='Health',]
        }
        if(input$active) {
            return(data[data$status=='active',])
        } else {
            return(aggregate(count ~ yearSemester + course, data, sum))
        }
    })
    
    ## plot the 
    output$chartView1 <- renderChart({
        data <- dataInput1()
        fig <- nPlot(count ~ year, group = "course", data = data, type = "multiBarChart")
        fig$addParams(dom = 'chartView1')
        return(fig)
    })
    
    output$chartView2 <- renderChart({
        data <- dataInput2()
        fig <- xPlot(count ~ yearSemester, group='course', data = data, type='line-dotted')
        fig$addParams(dom = 'chartView2')
        return(fig)
    })
})