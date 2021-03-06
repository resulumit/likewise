# ui.R

# load libraries
library(shiny)
library(shinyWidgets)
library(shinyBS)
library(DT)

# Start: page ----
fluidPage(
  
# Style the validation message
  tags$head(tags$style(HTML(".shiny-output-error-validation { color: #ff0000; font-weight: bold; font-size: 15px;}"))),

# App title ----
  titlePanel("LikeWise"),

# Help text ----
  helpText("An app that filters users' likes on Twitter", HTML("&mdash;"),
            "by", a("Resul Umit", href = "https://resulumit.com"), "(2020)."),


# Sidebar layout with input and output definitions ----
  sidebarLayout(

# Sidebar panel for inputs ----
  sidebarPanel(

helpText("1. Retrieve the tweets"),    
    
# Input: Liked by ----
textInput(inputId = "liked_by", label = "Liked by", placeholder = "Twitter username"),

# Input: Tooltip for Liked by ----
bsTooltip(id = "liked_by", title = "Not case or @ sensitive &mdash; anyting goes.",
          placement = "top", options = list(container = "body")),

# Input: Search ----
actionButton(inputId = "search_now", label = "Submit"),

HTML("<h2>&nbsp; &nbsp; &nbsp;</h2>"),

helpText("2. Filter the tweets"),

# Input: Tweeted by ----
textInput(inputId = "tweeted_by", label = "Tweeted by", placeholder = "Twitter username"),

# Input: Tooltip for tweeted by ----
bsTooltip(id = "tweeted_by", title = "Not case or @ sensitive &mdash; anyting goes.",
          placement = "top", options = list(container = "body")),

# Input: Date ----
dateRangeInput("daterange", label = "...within the date range", format = "yyyy/mm/dd", separator = HTML("&ndash;"),
               start = as.POSIXct(Sys.Date() - 365), end = as.POSIXct(Sys.Date())),

# Input: Scope ----
textInput(inputId = "text_search", label = "...including the pattern", placeholder = "Filter by text pattern"),

# Input: Tooltip for Scope ----
bsTooltip(id = "text_search", title = "Searching <i>us</i> catches <i>us</i>, <i>bus</i>, <i>US</i>, <i>USA</i> ...",
          placement = "top", options = list(container = "body")),


# End: sidebarPanel ----
),

# Start: MainPanel ----
mainPanel(
  tabsetPanel(
    tabPanel("Table", DT::dataTableOutput(outputId = "table")),
    tabPanel("Notes",
             br(),
             p("The source code is available at", a("https://github.com/resulumit/likewise.", href = "https://github.com/resulumit/likewise"),
             p("Twitter will not return more than 3200 most recent likes. In practice, it may return fewer than this limit at any given request."))
             )))

# End: sidebarLayout ----
)

# End: fluidpage ----
)
