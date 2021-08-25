# Code to transform raw event and node data into files in "data/" directory

# We'll use the pipe later
library(magrittr)

# Use this function to read in raw data and generate lists
qread_film <- function(edge.file, node.file, offset=0) {
  # First, let's read in the event list and the node list
  lines <- read.csv(edge.file, sep = ',', stringsAsFactors = FALSE)
  # Now, let's read in the node list and add some attributes we'll want later
  chars <- read.csv(node.file, sep = ',', stringsAsFactors = FALSE)
  chars$nlines <- vector("numeric", nrow(chars))
  for (i in 1:nrow(chars)) {
    chars$nlines[i] <- length(which(lines[ , (3 + offset)] == i))
  }
  chars$linesin <- colSums(lines[ , (4 + offset):ncol(lines)])
  chars$gender <- ifelse(chars$char_female == 1, "Female", "Male")
  # This makes sure the code runs with non-numeric input (it's a hacky fix):
  if((FALSE %in% (apply(lines, 2, class) %in% "integer")) == FALSE) {
    lines <- as.matrix(lines)
  }

  # Create adjacency matrix from the event list
  adj <- matrix(0, nrow(chars), nrow(chars))
  for (i in 1:nrow(chars)) {
    for (j in 1:nrow(chars)) {
      adj[i,j] <- length(which(lines[ , 3 + offset] == i &
                                 lines[ , j + (3 + offset)] == 1))
    }
  }
  colnames(adj) <- chars$char_name
  rownames(adj) <- chars$char_name

  list(event_list = lines, node_list = chars, adjacency = adj)
}

# Vectorise file names and output names to make this process easy to iterate
lines_file_names <- "data-raw/" %>%
  list.files() %>%
  .[stringr::str_detect(., "lines.csv")]

chars_file_names <- "data-raw/" %>%
  list.files() %>%
  .[stringr::str_detect(., "chars.csv")]

object_names <- lines_file_names %>%
  stringr::str_extract(., "^.+_[0-9][0-9]")

for(i in 1:length(object_names)) {
  my_data <- qread_film(edge.file = paste0("data-raw/", lines_file_names[i]),
                        node.file = paste0("data-raw/", chars_file_names[i]))
  assign(x = object_names[i], value = my_data, pos = ".GlobalEnv")
}

# I'm sure I could have found a smarter way to do this but here we are:
usethis::use_data(alien_01)
usethis::use_data(breakfast_01)
usethis::use_data(frozen_01)
usethis::use_data(hunger_01)
usethis::use_data(hunger_02)
usethis::use_data(hunger_03)
usethis::use_data(hunger_04)
usethis::use_data(marvel_01)
usethis::use_data(marvel_02)
usethis::use_data(marvel_03)
usethis::use_data(marvel_04)
usethis::use_data(marvel_05)
usethis::use_data(marvel_06)
usethis::use_data(marvel_07)
usethis::use_data(marvel_08)
usethis::use_data(marvel_09)
usethis::use_data(marvel_10)
usethis::use_data(marvel_11)
usethis::use_data(marvel_12)
usethis::use_data(marvel_13)
usethis::use_data(marvel_14)
usethis::use_data(marvel_15)
usethis::use_data(marvel_16)
usethis::use_data(marvel_17)
usethis::use_data(marvel_18)
usethis::use_data(starwars_01)
usethis::use_data(tombraider_01)
usethis::use_data(tombraider_02)
usethis::use_data(tombraider_03)
usethis::use_data(wonder_01)
