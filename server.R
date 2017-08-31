
library(shiny)
library(shinydashboard)
library(example)

url_ls <- example:::abs_urls


shinyServer(function(input, output) {

  output$table_found <- renderDataTable({
    print(input$fetch_but)
    if(input$fetch_but == 1) {

      ls_element <- url_ls[input$cat_num]
      
      message("select part")
      print(ls_element)
      
      nm <- map_chr(ls_element, "file_name")
      
      message("name")
      print(nm)
      
      message("url")
      print(map(ls_element, "url"))
      print(map_chr(ls_element, "url"))
      
      download.file(map_chr(ls_element, "url"), glue("{getwd()}/data/{nm}.xls"), mode="wb")

      readxl::read_xls(glue("{getwd()}/data/{nm}.xls"), sheet = 2)

    } else {
      print("nothing")
        NULL
    }

  })

})
