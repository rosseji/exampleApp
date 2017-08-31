
library(shiny)
library(shinydashboard)
library(tidyverse)

library(example)


url_ls <- example:::abs_urls


# Define UI for application that draws a histogram
shinyUI(
  navbarPage("ABS Tool",
    tabPanel(title = "Fetch",
             selectInput("cat_num",
                         label = "Choose a series",
                         choices = names(url_ls)
                         ),
             actionButton("fetch_but",
                          "Fetch"),
             dataTableOutput("table_found")
             ),
    tabPanel(title = "something else ...")
  )
  
)
