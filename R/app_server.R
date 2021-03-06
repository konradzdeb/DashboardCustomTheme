#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom graphics hist
#' @importFrom stats rnorm
#' @noRd
app_server <- function( input, output, session ) {

        set.seed(122)
        histdata <- rnorm(500)

        output$plot1 <- renderPlot({
            data <- histdata[seq_len(input$slider)]
            hist(data)
        })
}
