# Code to transform raw event and node lists into files in "data/" directory

# install.packages("charinet")
# install.packages("magrittr")
# install.packages("stringr")
library(magrittr)

# Vectorise file names and output names to make this process easy to iterate
events_file_names <- "data-raw/" %>%
  list.files() %>%
  .[stringr::str_detect(., "eventlist.csv")]

nodes_file_names <- "data-raw/" %>%
  list.files() %>%
  .[stringr::str_detect(., "nodelist.csv")]

object_names <- stringr::str_extract(events_file_names, "[^-]+")

for(i in 1:length(object_names)) {
  my_data <- charinet::qread_charinet(
    events_file = paste0("data-raw/", events_file_names[i]),
    nodes_file = paste0("data-raw/", nodes_file_names[i]),
    check_errors = FALSE
    )
  assign(x = object_names[i], value = my_data, pos = ".GlobalEnv")
}

usethis::use_data(alien01)
usethis::use_data(frozen)
usethis::use_data(mcu01_ironman)
usethis::use_data(mcu02_incrediblehulk)
usethis::use_data(mcu03_ironman2)
usethis::use_data(mcu04_thor)
usethis::use_data(mcu05_captainamerica)
usethis::use_data(mcu06_avengers)
usethis::use_data(mcu07_ironman3)
usethis::use_data(mcu08_thor2)
usethis::use_data(mcu09_captainamerica2)
usethis::use_data(mcu10_gotg)
usethis::use_data(mcu11_ageofultron)
usethis::use_data(mcu12_antman)
usethis::use_data(mcu13_captainamerica3)
usethis::use_data(mcu14_doctorstrange)
usethis::use_data(mcu15_gotg2)
usethis::use_data(mcu16_spiderman)
usethis::use_data(mcu17_thor3)
usethis::use_data(mcu18_blackpanther)
usethis::use_data(starwars_tfa)
usethis::use_data(thebreakfastclub)
usethis::use_data(thg01)
usethis::use_data(thg02)
usethis::use_data(thg03)
usethis::use_data(thg04)
usethis::use_data(tr01_laracroft)
usethis::use_data(tr02_laracroft2)
usethis::use_data(tr03_tombraider)
usethis::use_data(ww01_wonderwoman)
