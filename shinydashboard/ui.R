# use Command + I to align parentheses
# dashboard header ----------------------------
header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboardHeader

# dashboard sidebar ----------------------------
sidebar <- dashboardSidebar(
  
  #sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# dashboard body ----------------------------
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    #welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column
            column(width = 6,
                   
                   box(width = NULL, # when inside a column() set width to null since it will default to column width
                       title = tagList(icon("water"), tags$strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       tags$img(src = "map.jpeg",
                                alt = "here is some alt text",
                                style = "max-width: 100%;"),
                       tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org", "FCWO")), style = "text-align: center;")
                   ) # END left-box
                   
            ), # END left-column
            
            # right-hand column ----
            column(width = 6,
                   
                   # top fluid row ----
                   fluidRow(
                     
                     box(width = NULL,
                         
                         title = tagList(icon("pen"), tags$strong("Citation")),
                         includeMarkdown("text/citation.md")
                         
                     ) # END box
                     
                   ), # END top fluid row
                   
                   # bottom fluidRow ----
                   fluidRow(
                     
                     box(width = NULL,
                         
                         title = tagList(icon("hand"), tags$strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         
                     ) # END box
                     
                   ) # END second fluidRow
                   
            ) # END right column
            
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ---- 
            fluidRow(
              
              #input Box ----
              box(width = 4, #total of 12 units across the page, using 4 of 12
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInput ----
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                  
              ), # END input box
              
              # leaflet box ----
              box(width = 8, 
                  
                  title = tags$strong("Monitored lakes within Fish Creek Watershed:"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") |> withSpinner(type = 1, color = "#742361")
                  
              ) # END leaflet box
              
            )# END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

# combine all ----------------------------
dashboardPage(header, sidebar, body)
