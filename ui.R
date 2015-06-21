library(shiny)
library(markdown)

shinyUI(fluidPage(navbarPage("Flowers&Trees",
                   tabPanel("Home",
                            fluidRow(
                                    column(6,
                                           includeMarkdown("about.md")
                                    ),
                                    column(3,
                                           img(class="img-polaroid",
                                               
                                               src=paste0("http://www.florespedia.com/",
                                                          "Imagenes/lilas.jpg"),
                                               width = "600px", height = "300px"),
                                           tags$small(
                                                   " ",
                                                   a(href="")
                                           )
                                    )
                            )
                   ),            
                   tabPanel("Table and Summary",
                            sidebarLayout(
                                    sidebarPanel(
                                            selectInput("dataset", "Choose a dataset:", 
                                                        choices = c("Flowers", "Trees")),
                                            
                                            numericInput("obs", "Number of observations to view:", 10),
                                            
                                            helpText("Note: while the data view will show only the specified",
                                                     "number of observations, the summary will still be based",
                                                     "on the full dataset.")
                                            
                                           # submitButton("Choose")
                                    ),
                                    
                                    # Show a summary of the dataset and an HTML table.
                                    mainPanel(
                                            h4("Summary"),
                                            verbatimTextOutput("summary"),
                                            
                                            h4("Observations"),
                                            tableOutput("view")
                                    )
                            )
                   ),
                   tabPanel("Plot",
                           # sidebarLayout(
                           #         sidebarPanel(
                           #                 radioButtons("plotType", "Plot type",
                           #                              c("Scatter"="p", "Line"="l")
                           #                 )
                           #         ),
                           #         mainPanel(
                           #                 plotOutput("plot")
                           #         )
                           # )
                           
                           sidebarLayout(
                                   sidebarPanel(
                                           radioButtons("plants", "Distribution type:",
                                                        c("Flowers" = "fr",
                                                          "Trees" = "Trees"
                                                          )),
                                           br(),
                                           
                                           sliderInput("n", 
                                                       "Number of observations:", 
                                                       value = 10,
                                                       min = 1, 
                                                       max = 30)
                                   ),
                                   mainPanel(
                                           plotOutput("plot") 
                                           
                                   )
                                   
                           
                           )
                           
                           
                           
                   )
                   
)))
