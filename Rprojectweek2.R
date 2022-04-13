library(tidyverse)
#Read
df<-read.csv("Life_Expectancy.csv")
View(df)
library(dplyr)
#Find null value
which(is.na(df))
df1<-df %>% na_if("")
#Eliminate all null values

df<- drop_na(df1)

View(df)
# checking data
summary(df)
# After checking data, it shows The minimum BMI equal to 1. Which doesn't make sense
# The lowest BMI that has ever recorded equals 7.5.(source:https://edinstitute.org/blog/2011/12/8/part-v-fat-no-more-fear-no-more-contempt)
DS<-df %>% filter(BMI >= 7.5)
df<- drop_na(DS)

library(shinythemes)


ui <- fluidPage(theam = shinytheme("cerulean"),
                navbarPage(
                tabPanel("Navbar 1",
                headerPanel("Analyzing Life Expectancy Dataset"),
  
  sidebarPanel(
    selectInput("c1", "please choose column one", choices = names(df)),
    selectInput("c2", "please choose column two", choices = names(df)),),
  
  mainPanel(
    radioButtons("PlotColor", "Please Select Plot Color:",
                       c("blue", "black", "red"), selected ='blue'),

    sliderInput("Plotsize", "Please Select size of plots",
                min = 1, max = 5, value = 2),
    
    plotOutput("plot")),
  selectInput("c3", "choose the column to calculate the maximum", choices =names(df),),
  tableOutput("table1"),
  verbatimTextOutput("text1"), 
  tabPanel("Navbar 2", "This panel is intentionally left blank"),
  
  )))
  


server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(df, aes(x = .data[[input$c1]], y = .data[[input$c2]])) +
      geom_point(color=input$PlotColor, size=as.numeric(input$Plotsize))+geom_smooth()
  })
  output$table1 <- renderTable({
    choose1= .data[[input$c3]]
    max(choose1)
  })
  output$text1 <- renderPrint({
    choose1= input$c3
    summary(choose1)}
  )
}

shinyApp(ui = ui, server = server)


