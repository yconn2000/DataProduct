library(shiny)

# all sessions scope
mtcars$am <- factor(mtcars$am)
levels(mtcars$am) <- c('automatic', 'manual')
fit <- lm(mpg ~ ., mtcars)
bestfit <- step(fit, direction="backward")

function(input, output) {

  data <- reactive({
    cylnd <- switch(input$cylnd,
                   Four = 4,
                   Six = 6,
                   Eight = 8)
  })

  wt <- eventReactive(input$goButton, {input$wt})
  output$wt <- renderText({wt()})
  cylnd <- eventReactive(input$goButton, {input$cylnd})
  output$cylnd <- renderText({cylnd()})

  am <- eventReactive(input$goButton, {input$am})
  output$am <- renderText({am()})

  pred <- eventReactive(input$goButton, {
    newdata <- data.frame( wt=(as.numeric(wt()/1000)),
                           cylnd=(cylnd()),
                           qsec=as.numeric((18)), am=am())

   round(predict(bestfit, newdata), 2)
  })

  output$pred <- renderText({pred()})
}
