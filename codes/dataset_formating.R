library(tidyverse)
library (rio)
here::here()

nhefs_raw <- rio::import(here::here("data/raw/folder1/nhefs_data.csv")

#To import a file using here
strepto <- read_csv(here::here("folder1", "folder2", "file_name.csv"), skip = 1, col_names =  "", "")

#To save the imported a file
save(dataframe, file = here::here("folder1", "folder2", "file_name.RData"))
#SAVE as permanent R Files (two types)#
save(mesa, file = "mesa.RData")


# column names
nlsy_cols <- c("glasses", "eyesight", "sleep_wkdy", "sleep_wknd",
               "id", "nsibs", "samp", "race_eth", "sex", "region",
               "income", "res_1980", "res_2002", "age_bir")

# read in raw data, replacing missing values with NA
nlsy <- read_csv(here::here("data", "raw", "nlsy.csv"),
                 na = c("-1", "-2", "-3", "-4", "-5", "-998"),
                 skip = 1, col_names = nlsy_cols)

# create factors for categorical variables
nlsy_cats <- nlsy |>
  mutate(region_cat = factor(region, labels = c("Northeast", "North Central", "South", "West")),
         sex_cat = factor(sex, labels = c("Male", "Female")),
         race_eth_cat = factor(race_eth, labels = c("Hispanic", "Black", "Non-Black, Non-Hispanic")),
         eyesight_cat = factor(eyesight, labels = c("Excellent", "Very good", "Good", "Fair", "Poor")),
         glasses_cat = factor(glasses, labels = c("No", "Yes")))