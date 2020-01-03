library(dplyr)

#Change the directory letter to match the one on your PC - here it is "M"

am_id <- read.csv("M:/biome_health_project_files/country_files/kenya/kenya_audio_locations.csv", stringsAsFactors = FALSE)

sdf <- list.files("K:/", full.names = TRUE)   #list files in the sd card

am <- 68 # the id for the audio moth

loc <- am_id %>% 
  filter(audiomoth_id == am)   #filtering to the relevant row in the audio_locations csv

site <- gsub('[0-9]+', '', loc$location_id)

file_names <- basename(sdf)
new_files_names <- paste0(loc$location_id, "_", file_names)
#"M:\biome_health_project_files\country_files\nepal\working_data\OBZ\OBZ20\PAM\2019"

new_flocs <- paste0("M:/biome_health_project_files/country_files/kenya/working_data/", site, "/", loc$location_id, "/PAM/2019/", new_files_names)

dir.create(paste0("M:/biome_health_project_files/country_files/kenya/working_data/", site, "/", loc$location_id, "/PAM/2019/"), recursive = TRUE)

file.copy(sdf, new_flocs, overwrite = TRUE)
