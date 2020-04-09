## -----------------------------------------------------------------------------
library(decoder)

## ---- echo = FALSE, message=FALSE---------------------------------------------
library(decoder)
suppressPackageStartupMessages(library(dplyr))

sjukhus_all <-
  suppressWarnings(
    dplyr::bind_rows(
      rockan = sjukhus,
      inca   = sjukhus_inca,
      par    = sjukhus_par,
      .id    = "source"
    )
  )

key_n_sources <- 
  sjukhus_all %>% 
  count(key, sort = TRUE)

## ---- echo = FALSE, message = FALSE-------------------------------------------
sjukhus_most <- 
  suppressWarnings(
    dplyr::bind_rows(
      rockan = sjukhus,
      inca   = sjukhus_inca,
      par    = sjukhus_par,
      .id    = "source"
    )
  )

key_n_sources <- 
  sjukhus_most %>% 
  count(key, sort = TRUE)
in3 <- key_n_sources %>% filter(n == 3)

sjukhus_most %>% 
  inner_join(in3, "key") %>% 
  arrange(key) %>% 
  tidyr::spread(source, value) %>% 
  select(-n) %>% 
  knitr::kable()

