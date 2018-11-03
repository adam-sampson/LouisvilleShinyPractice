#******************************************************************************#
# Sample Shiny Dashoard Using Modules
# Author: Adam Sampson
# Date: 2018-11-02
# Description: This is an example of how to make a shiny app using modules. Data
#     is from Louisville Metro Open Data and is a snapshot. It is possible to 
#     connect to the API, but that is outside the scope of this exercise.
#******************************************************************************#

# Load Libraries ----------------------------------------------------------
library(shiny)
library(shinydashboard)
library(DT)
library(tidyverse)

# Connect to Global Data Sources (such as databases) ----------------------


# Source Module Code ------------------------------------------------------
source("./modules/lou_metro_services_module.R")
source("./modules/lou_yelp_module.R")

# Shiny App Parameters ----------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Louisville Example"),
  dashboardSidebar(
    sidebarMenu(
      # The Menu ----------------------------------------------------------------
      menuItem("Metro Services", tabName = "lou_metro_tab", icon = icon("concierge-bell")),
      menuItem("Lou. Yelp Data", tabName = "lou_yelp_tab", icon = icon("yelp"))
    )
  ),
  dashboardBody(
    tabItems(
      louMetroServicesUI("lou_metro_services"),
      louYelpUI("lou_yelp")
    )
  )
)


# Shiny Control Functions -------------------------------------------------
server <- function(input, output) {
  callModule(louMetroCtrl,"lou_metro_services")
}

# Run the Shiny App -------------------------------------------------------
shinyApp(ui, server)