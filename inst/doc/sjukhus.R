## -----------------------------------------------------------------------------
library(decoder)

## ---- echo = FALSE, message=FALSE---------------------------------------------
library(decoder)
suppressPackageStartupMessages(library(dplyr))

sjukhus_all <-
  suppressWarnings(
    bind_rows(
      rockan = as_tibble(sjukhus),
      inca   = as_tibble(sjukhus_inca),
      par    = as_tibble(sjukhus_par),
      .id    = "source"
    )
  )

key_n_sources <- 
  sjukhus_all %>% 
  count(key, sort = TRUE)

## ---- echo = FALSE, message = FALSE-------------------------------------------

key_n_sources <- 
  sjukhus_all %>% 
  count(key, sort = TRUE)
in3 <- key_n_sources %>% filter(n == 3)

sjukhus_all %>% 
  inner_join(in3, "key") %>% 
  arrange(key) %>% 
  tidyr::spread(source, value) %>% 
  select(-n) %>% 
  knitr::kable()

