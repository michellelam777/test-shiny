# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(palmerpenguins)
library(sass)

# COMPILE CSS ----
sass(input = sass_file("R/sass_styles.scss"), #location of .scss file created
           output = "www/sass_styles.css") #create new .css file and save in www folder