library(shiny)
library(datasets)

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
        
        # Return the requested dataset
        
        datasetInput <- reactive({
                switch(input$dataset,
                       "Flowers" = fr,
                       "Trees" = Trees)
        })
        
        dataInput <- reactive({
                 switch(input$plants,
                                  fr = fr$Durability,
                                  Trees  = Trees$Height
                                 )
              
             
        })
        
        output$plot <- renderPlot({
                
               plants <- dataInput()
                n <- input$n
                ss <- plants[1:n]
                hist(ss, , main= "Flowers Durability by Nutrient", xlab="Durability") 
                 #    main=paste(plants, '(', n, ')', sep=''))
        })
      
        # Generate a summary of the dataset
        output$summary <- renderPrint({
                dataset <- datasetInput()
                summary(dataset)
        })
        
        # Show the first "n" observations
        output$view <- renderTable({
                head(datasetInput(), n = input$obs)
        })
        
       
})