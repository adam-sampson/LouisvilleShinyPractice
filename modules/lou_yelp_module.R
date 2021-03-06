require(shiny)
require(shinydashboard)
require(tidyverse)
require(DT)

# Load Data Sets ----------------------------------------------------------
yelp_businesses_df <- read_csv("./data/businesses.csv")
yelp_inspections_df <- read_csv("./data/inspections.csv")
yelp_violations_df <- read_csv("./data/violations.csv")

# Module UI ---------------------------------------------------------------
louYelpUI <- function(id){
  # Manage the namespace for this module
  ns <- NS(id)
  
  tabItem(
    tabName = "lou_yelp_tab",
    fluidRow(
      box(
        width = 12,
        h2("Louisville Open Yelp Data")
      ) # End Box
    ) # End Row
  ) # End lou_yelp_tab
}

# Module Controls ---------------------------------------------------------
louYelpCtrl <- function(input, output, session){
  
}

# Generic (non-reactive) Functions ----------------------------------------
