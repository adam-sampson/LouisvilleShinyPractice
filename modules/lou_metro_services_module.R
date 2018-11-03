require(shiny)
require(shinydashboard)
require(tidyverse)
require(DT)

# Load Data Sets ----------------------------------------------------------



# Module UI ---------------------------------------------------------------
louMetroServicesUI <- function(id){
  # Manage the namespace for this module
  ns <- NS(id)
  
  tabItem(
    tabName = "lou_metro_tab",
    fluidRow(
      box(
        width = 12,
        h2("Louisville Metro Services")
      ) # End Box
    ) # End Row
  ) # End lou_metro_tab
}

# Module Controls ---------------------------------------------------------
louYelpCtrl <- function(input, output, session){
  
}

# Generic (non-reactive) Functions ----------------------------------------
