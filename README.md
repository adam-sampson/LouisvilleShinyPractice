# Example Shiny App Using Modules and Louisville Open Data

In a recent discussion regarding the use of modules in Shiny apps an associate described their frustrations with modules. This repository is intended to show the use of modules in a basic but powerful way.

Modules have both advantages and disadvantages when coding Shiny Apps. This example is so simple that it will not be able to demonstrate the need for itself without additional information. Some of the disadvantages of modularization will be shown in the app, but not all of them. A clear presentation will be created to go over these at a later date. However, this example repository strives to make the modularized code easy enough to understand that it will not be an obstacle in understanding the advantages and disadvantages. 

# The App

The app is created using `shinydashboard`. 

# The Data

Data was retrieved from the Louisville Open Data site. 

The API was used for metro services because it is the only data available. The Yelp information is a napshot in time of the most recent csv file available on 2018-11-02. This was done to keep the app as simple as possible. The goal is to make it easy to understand modularization in shiny apps and not how to collect data.

- Metro services data is located at: [https://data.louisvilleky.gov/dataset/louisville-metro-services-lookup]
- Yelp Data is located at: [https://data.louisvilleky.gov/dataset/yelp-data]
