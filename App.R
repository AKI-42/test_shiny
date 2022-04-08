#library(shinycssloaders)
#library(shinyjs)

shinyUI(fluidPage(
  dashboardPage(
    dashboardHeader(title = tags$p("title", style="font-size:40px;")),
    dashboardSidebar(
      fluidRow(
        column(width=12, align="center", hr(),
               fileInput(inputId = "file1", label = tags$p("Choose CSV File", style="font-size:14px; margin-bottom: 1px;"),
                         accept = c(".csv"),
                         multiple = FALSE,
                         width = "100%",
                         buttonLabel = "選択",
                         placeholder = "No file selected"
               )
        )
      ),
      fluidRow(
        column(width=12, align="center", hr(),
          selectizeInput("Variable", label = "変数の選択", choices = "", options = list(maxOptions = 5000), multiple=TRUE),
          actionButton("class_extra_button", label = "参考クラス数抽出", width = "70%")
        )
      ),
      fluidRow(
        column(width=12, align="center",hr(), 
               selectizeInput("Variable", label = "クラス数の指定", choices = c("test1", "test2", "test3"), options = list(maxOptions = 5000)),
               actionButton("class_exec_button", label = "潜在クラス分析実行", width = "70%")
        )
      ),
      fluidRow(
        column(width=12, align="center",hr(),
               actionButton("file_output_button", label = "クラス付きCSVファイル出力", width = "90%"),
               hr()
        )
      )
  ),
  dashboardBody(
#    tags$script(HTML(strJavaScript01)),
    navbarPage("Main Menus", id="mainTabs", selected = "dataUpload", 
               tabPanel(title = "Data", value="dataUpload", tabName = "dataUpload", icon = icon("table"),
                        fluidRow(
                          column(width=10, offset=1, align="center", br(),
                                 uiOutput("quickLook")
                          )
                        )
               ),
               tabPanel(title = "Ref_class", value="Ref_class", icon = icon("table"),
                        shinydashboard::box(
                          title = "Ref_class",
                          status = "primary",
                          visNetworkOutput("plot_ref_class", height = 550),
                          width = "100%",
                          height = 600
                        )
               ),
               tabPanel(title = "LCA result", value="lca", icon = icon("table"),
                        shinydashboard::box(
                          title = "LCA",
                          status = "primary",
                          visNetworkOutput("plot_lca", height = 550),
                          width = "100%",
                          height = 600
                        )
               )
    )
  )
  )
  )
)