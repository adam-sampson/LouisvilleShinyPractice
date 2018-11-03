require(shiny)
require(shinydashboard)
require(shinycssloaders)
require(tidyverse)
require(jsonlite)
require(DT)

# Load Data Sets ----------------------------------------------------------
# Metro Services is an API
# https://api.louisvilleky.gov/api/geo/FindQuickServiceLookup?address=YOUR%20_ADDRESS_%20_HERE_&city=Louisville
metro_services_api_prefix <- "https://api.louisvilleky.gov/api/geo/FindQuickServiceLookup?address="
metro_services_api_suffix <- "&city=Louisville"

# Module UI ---------------------------------------------------------------
louMetroServicesUI <- function(id){
  # Manage the namespace for this module
  ns <- NS(id)
  
  tabItem(
    tabName = "lou_metro_tab",
    fluidRow(
      box(
        width = 12,
        h2("Search Louisville Metro Services by Address")
      ), # End Box
      box(
        width = 4,
        textInput(ns("address_txt_input"), label = h3("Address to Search:")),
        br(),
        actionButton(ns("search_metro_services_btn"),"Search",
                     style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
      ),
      box(
        width = 8,
        h3("Results:"),
        hr(),
        DTOutput(ns("metro_service_results")) %>% withSpinner(type = 8)
      )
    ) # End Row
  ) # End lou_metro_tab
}

# Module Controls ---------------------------------------------------------
louMetroCtrl <- function(input, output, session){
  metro_service_data <- eventReactive(input$search_metro_services_btn,{
    # Debug print only visible in cosole
    print("Search Button Clicked")
    
    # Require text in the address field or quit if blank
    req(input$address_txt_input)
    
    # Create a spinning wait icon over the output table...
    # TBD
    
    # Get Data from API
    df <- API_address_search(input$address_txt_input)
    
    # Cleanup, transpose, and convert to tibble
    # df <- as_tibble(cbind(Field = names(df), t(df)))
    df <- df %>% 
      select(Address = Address1,
             City,
             County,
             State,
             `Zip Code` = ZipCode,
             Latitude,
             Longitude,
             `Is Address in Service District` = InServiceDistrict,
             `LOJIC Neighborhood Name` = LojicNeighborhoodName,
             `Garbage Day` = GarbageDay,
             `Yard Waste Recycling Day` = YardWasteRecycleDay,
             `Junk Set Out Begin Date` = JunkSetOutBegin,
             `Junk Set Out End Date` = JunkSetOutEnd,
             `Police Division` = PoliceDivision,
             `Police Beat` = PoliceBeat,
             `Police Sector` = PoliceSector,
             `Police Zone` = PoliceZone,
             `Fire District` = FireDistrict,
             `Counsil District` = CounsilDistrict) %>% 
      (function(x){as_tibble(cbind(Field = names(x), t(x)))})
    
    names(df)[2] <- "Data" # Rename the transposed column
    
    # Stop the spinning wait icon...
    # TBD
    
    # Debug print only visible in cosole
    print(df)
    
    return(df)
  }) # End event reactive of search button -> metro_service_data
  
  output$metro_service_results <- renderDT(
    metro_service_data(),
    options = list(
      pageLength = 20,
      dom='t',
      ordering=F
    )
  )
}

# Generic (non-reactive) Functions ----------------------------------------
API_address_search <- function(address.string){
  api_url <- paste0(
    metro_services_api_prefix,
    address.string,
    metro_services_api_suffix
    ) %>%
    URLencode()
  df <- fromJSON(api_url, simplifyDataFrame = TRUE)
  return(df)
}