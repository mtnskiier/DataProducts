
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
# Preload datasets
library(titanic)



library(shiny)

shinyServer(function(input, output) {
        df <- titanic_train[complete.cases(titanic_train), ]
        output$piePlot <- renderPlot({
                 # get inputs
                female <- input$Gender
                pclass <- input$pclass
                age <- as.integer(input$age)
             
                sdf <- df[(df$Pclass == pclass) & (df$Age < age + 1) & (df$Age > age - 10), ]
                
                if (female == TRUE) {
                        sdf <- sdf[sdf$Sex == "female",]
                } else {
                        sdf <- sdf[sdf$Sex == "male",]
                }
                total <- nrow(sdf)
                lived <- sum(sdf$Survived)
                
                if (total > 0) {
                        slices <- c(lived, (total - lived))
                        pct <- round(slices/sum(slices)*100)
                        labs <- c("Surivived", "Perished")
                        labs <- paste(labs, pct)
                        labs <- paste0(labs, "%")
                        
                        pie(slices, labels = labs, main = "Would you survive the Titanic?")
                } else {
                       plot(0, type = "n", axes=FALSE, xlab="", ylab="",
                            main = "No Passengers Fit This Description")
                }
         
         })

})
