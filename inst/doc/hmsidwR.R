## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

options(rmarkdown.html_vignette.check_title = FALSE)

## ----eval=FALSE---------------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("Fgazzelloni/hmsidwR")

## -----------------------------------------------------------------------------
library(hmsidwR)

## -----------------------------------------------------------------------------
hmsidwR::sdi90_19 |>
  head()

## -----------------------------------------------------------------------------
hmsidwR::deaths2019 |>
  head()

## -----------------------------------------------------------------------------
library(tidyverse)
id <- hmsidwR::id_affected_countries %>%
  ggplot(aes(
    x = year,
    group = location_name
  )) +
  geom_line(aes(y = YLLs),
    linewidth = 0.2,
    color = "grey"
  ) +
  geom_line(
    data = id_affected_countries %>%
      filter(location_name %in% c(
        "Lesotho",
        "Eswatini",
        "Malawi",
        "Central African Republic",
        "Zambia"
      )),
    aes(y = YLLs, color = location_name)
  ) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(
    title = "Countries with highest AVG YLLs",
    subtitle = "due to infectious diseases from 1990 to 2021",
    caption = "DataSource: IHME GBD Results for infectious diseases deaths and YLLs 1980 to 1999",
    x = "Year", y = "DALYs"
  )
# add a plotly version
library(plotly)
plotly::ggplotly(id)

