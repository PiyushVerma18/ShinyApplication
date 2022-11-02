library(shiny)
library(rsconnect)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Data Analysis",
                      fluidPage(
                        titlePanel("The relationship between different variables and price of diamonds"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Weight of the diamond" = "carat",
                                          "Quality of the cut " = "cut",
                                          "Diamond colour, from D (best) to J (worst)" = "color",
                                          "measurement of clearity of the diamond" = "clarity",
                                          "Xdimension" = "x",
                                          "Ydimension" = "y",
                                          "Zdimension" = "z",
                                          "Total depth percentage" = "depth",
                                          "Width of top of diamond relative to widest point" = "table"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("DiamondboxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("diamondPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("Documentation and Data Detail",
                      
                      h2("Shiny Application with Regression Models Course Project"),
                      h3("Prices of over 50,000 round cut diamonds"),
                      helpText("Here, we are using the diamonds dataset which will be containing the prices and other attributes of almost 54,000 diamonds. Beside price, the other variables are carat,cut,color,clarity, 3 dimensions(x,y,z),depth and table. With the help of this shiny app, you can see the linear relationship between different variables like dimension or quality and the price of the diamond.You just need to select a particular variable and then this app will figure out the relation between that variable and the price of the diamond."),
                      hr(),
                      h3("Format"),
                      p("A data frame with 53940 rows and 10 variables:"),
                      
                      p("  [1]   Price   Price in US dollars ($326–$18,823)"),
                      p("  [2]	 Carat	 weight of the diamond (0.2–5.01)"),
                      p("  [3]	 cut	 quality of the cut (Fair, Good, Very Good, Premium, Ideal)"),
                      p("  [4]	 color	 diamond colour, from D (best) to J (worst)"),
                      p("  [5]	 clarity  a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best)) "),
                      p("  [6]	 x	 length in mm (0–10.74)"),
                      p("  [7]	 y	 width in mm (0–58.9)"),
                      p("  [8]	 z	 depth in mm (0–31.8)"),
                      p("  [9]	 depth	 total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)"),
                      p("  [10]	 table	 width of top of diamond relative to widest point (43–95)")
                      
                      
                      
             )
  )
)