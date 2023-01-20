ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
           ), # END page 1 tabPanel
  
  # page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel ----
           tabsetPanel(
             
             #trout tab ----
             tabPanel(
               
             ) # END trout tab
             
           ) # END tabsetPanel
           
           ), # END data tabPanel
  
)