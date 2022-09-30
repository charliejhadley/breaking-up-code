library(tidyverse)

paygap_raw <- read_csv("data-raw/paygap_raw.csv")

paygap_clean <- paygap_raw %>% 
  select(contains("employer"), starts_with("male"), starts_with("female")) %>% 
  mutate(across(contains("quartile"), ~ . / 100))

paygap_clean %>% 
  write_csv("data/paygap_clean.csv")
