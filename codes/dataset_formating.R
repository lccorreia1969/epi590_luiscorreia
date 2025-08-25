library(tidyverse)
library (rio)
here::here()

#Import cvs
nhefs_raw <- rio::import(here::here("data/raw/nhefs_data.csv"))
#Save as RData
save(nhefs_raw, file = here::here("data/raw/nhefs_raw.RData"))


# create factors for categorical variables
nhefs_new <- nhefs_raw |>
  mutate(diabetes = ifelse(is.na(diabetes), NA, ifelse(
    diabetes == 2,NA, ifelse(diabetes == 1,1,0)))) |>
  
  mutate(active = factor(active, labels = c("Very Active", "Moderately Active", "Inactive")),
         sex = factor(sex, labels = c("Male", "Female")),
         race = factor(race, labels = c("White", "Black")),
         diabetes = factor(diabetes, labels = c("No", "Yes")),
         high_BP = factor(high_BP, labels = c("No", "Yes"))
         )
  


