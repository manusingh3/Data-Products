
shinyUI(
  navbarPage("N. L. Prater's Petrol Refinery Data",
             tabPanel("Detail",
                      h2("Petrol Refinery Data"),
                      hr(),
                      h3("Description"),
                      helpText("The yield of a petroleum refining process with four covariates. The crude oil appears to come from only 10 distinct samples.

These data were originally used by Prater (1956) to build an estimation equation for the yield of the refining process of crude oil to gasoline.)."),
                      h3("Format"),
                      p("A data frame with 32 observations on 6 variables."),
                      
                      p("  [, 1]   No   crude oil sample identification label. (Factor.)"),
                      p("  [, 2]	 SG	 specific gravity, degrees API. (Constant within sample.)"),
                      p("  [, 3]	 VP	 vapour pressure in pounds per square inch. (Constant within sample.)"),
                      p("  [, 4]	 V10	 volatility of crude; ASTM 10% point. (Constant within sample.)"),
                      p("  [, 5]	 EP	 desired volatility of gasoline. (The end point. Varies within sample.)"),
                     
                      p("  [, 6]	 Y	 yield as a percentage of crude"),
                     
                     
                                    
                      h3("Source"),
                      
                      p("N. H. Prater (1956) Estimate gasoline yields from crudes. Petroleum Refiner 35, 236-238.

This dataset is also given in D. J. Hand, F. Daly, K. McConway, D. Lunn and E. Ostrowski (eds) (1994) A Handbook of Small Data Sets. Chapman & Hall.")
             ),
             tabPanel("Analysis",        
             fluidPage(
                        titlePanel("The relationship between variables and Yeild (Y)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Crude oil sample identification" = "No",
                                          "Specific gravity" = "SG",
                                          "Vapour pressure(lb/sq inch)" = "VP",
                                          "Volatility of crude" = "V10",
                                          "Desired volatility of gasoline" = "EP"
                                         
                                         
                                         
                                        
                                        
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("SourceCode",
                      p("part1_devdataprod-shiny"),
                      a("https://github.com/manusingh3/Data-Products")
             )
             
)
)