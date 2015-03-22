source('common.R')
library(quantmod)

# Define server logic
shinyServer(function(input, output) {
    
    ## set the get data to reactive (load only if days change)
    dataInput <- reactive({
        stockSymb <- names(stockList[as.numeric(input$stockSymb)])
        getSymbols(stockSymb, src = "yahoo", 
                   from = Sys.Date()-input$days,
                   to = Sys.Date(),
                   auto.assign = FALSE)
    })
    
    ## plot the 
    output$stockPlot <- renderPlot({
        data <- dataInput()
        vals <- ""
        if(input$vo) { vals<-paste(vals,'addVo();', sep="") } 
        if(input$BBands) { vals<-paste(vals,'addBBands();', sep="") } 
        if(input$CCI) { vals<-paste(vals,'addCCI()', sep="") }
        if(nchar(vals)==0) { 
            chartSeries(data, theme = chartTheme("white"), type = "line", TA=NULL)
        } else {
            chartSeries(data, theme = chartTheme("white"), type = "line", TA=vals)
        }
        
        
    })
})