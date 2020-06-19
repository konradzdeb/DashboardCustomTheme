#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    dashboardPage(
      dashboardHeader(title = "Basic dashboard"),
      dashboardSidebar(),
      dashboardBody(# Boxes need to be put in a row (or column)
        fluidRow(
          box(plotOutput("plot1", height = 250)),

          box(
            title = "Controls",
            sliderInput("slider", "Number of observations:", 1, 100, 50)
          )
        ))
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @importFrom shinydashboard box dashboardBody dashboardHeader dashboardPage dashboardSidebar box
#' @importFrom bootstraplib bs_theme_new bs_theme_base_colors bootstrap bs_theme_add_variables bootstrap_sass
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path('www', app_sys('app/www'))

  # Set new theme
  bs_theme_new(version = "4+3", bootswatch = NULL)
  bs_theme_base_colors(bg = "salmon", fg = "white")
  bs_theme_add_variables(primary = "green")
  bootstrap_sass(".skin-blue, .left-side, .main-sidebar { background-color: #32CD32; }")

  tags$head(favicon(),
            bootstrap(),
            bundle_resources(path = app_sys('app/www'),
                             app_title = 'DashboardBootstrap'))
            # Add here other external resources
            # for example, you can add shinyalert::useShinyalert() )
}
