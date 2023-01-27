# LOAD PACKAGES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)


# READ IN DATA ----
lake_data <- read_csv("data/lake_data_processed.csv") # won't be able to run in script, but shiny uses relative paths (will work when you run the app)
