# ISA 401 Job Scout Chat: ask questions, get SQL, a table, or a chart back
library(querychat)
library(bslib)

con = DBI::dbConnect(RSQLite::SQLite(), "data/midwest_airbnb.db")

client = ellmer::chat_openai(
  model  = "gpt-5.6-luna",
  params = ellmer::params(reasoning_effort = "none")
)

qc = querychat(
  con, "listings",
  client   = client,
  tools    = c("filter", "query", "visualize"),
  greeting = "Ask me about 14,887 Airbnb listings in Chicago, Columbus, and the Twin Cities."
)

ui <- bslib::page_sidebar(
  title = "Midwest Airbnb Chat",
  theme = bslib::bs_theme(
    version = 5,
    bootswatch = "flatly"
  ),
  sidebar = qc$sidebar(),
  
  bslib::card(
    bslib::card_header("SQL Query"),
    verbatimTextOutput("sql_query")
  ),
  
  bslib::card(
    bslib::card_header("Results"),
    DT::DTOutput("data_table")
  ),
  
  bslib::card(
    bslib::card_header("About This Dataset"),
    bslib::card_body(
      "This app uses the Midwest Airbnb Listings dataset from Inside Airbnb. ",
      "The dataset contains 14,887 listings from Chicago, Columbus, and the Twin Cities. ",
      "Snapshot dates are July 20, 2026 for Chicago, July 23, 2026 for Columbus, ",
      "and July 21, 2026 for the Twin Cities. ",
      "Source: Inside Airbnb."
    )
  )
)

server <- function(input, output, session) {
  qc_vals <- qc$server()
  
  output$sql_query <- renderText({
    qc_vals$sql() %||% "No SQL query yet."
  })
  
  output$data_table <- DT::renderDT({
    qc_vals$df()
  })
}

shinyApp(ui, server)