library(tidyverse)
library(leaflet)

# read in processed data (lake_data_processed.csv) from the shinydoashboard folder and save as object called "filtered_lakes"
filtered_lakes <- read_csv("shinydashboard/data/lake_data_processed.csv")

# practice filtering 
lakes_new <- filtered_lakes |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6) # filter within a range of temperatures



# build leaflet map
leaflet() |> 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery") |> 
  
  # set view of AK (area of interest)
  setView(lng = -152, lat = 70, zoom = 6) |> 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> 
  
  # ADD MARKERS
  addMarkers(data = filtered_lakes, 
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste(
               "Site Name:", filtered_lakes$Site, "<br>", # adds break after Site Name to create a new line
               "Elevation:", filtered_lakes$Elevation, "meters (above SL)", "<br>",
               "Avg Depth:", filtered_lakes$AvgDepth, "meters", "<br>",
               "Avg Lake Bed Temperature:", filtered_lakes$AvgTemp, "deg Celsius"
             ))

