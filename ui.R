
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Would you survive the Titanic?"),

  # Sidebar with inputs on type of passenger
  sidebarLayout(
    sidebarPanel(
      checkboxInput("Gender", "Are you Female?", value = TRUE),
      radioButtons("pclass", "Class of accomodations:",
                   c("First" = "1",
                     "Second" = "2",
                     "Third" = "3")),
      radioButtons("age", "Age Range:",
                   c("0-10 years" = "10",
                     "11-20 years" = "20",
                     "21-30 years" = "30",
                     "31-40 years" = "40",
                     "41-50 years" = "50",
                     "51-60 years" = "60",
                     "61-70 years" = "70",
                     "71-80 years" = "80"))
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("piePlot"),
      
      h3("Select your gender, age, and which class of ticket to 
         see your likely outcome if you were a passenger on the maiden 
         voyage of the Titanic in April of 1912.")
    )
  )
))
