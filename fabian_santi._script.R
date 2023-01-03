############### DEMO fso-metada ##################

# # Installiere fso-metada-Package
# remotes::install_gitlab("dscc/fso-metadata", force = TRUE)
library(fso.metadata)
#library(tidyverse)

# get_codelist from fso-metada
head(get_codelist(identifier = 'CL_NOGA_DIVISION', language = 'fr'))
#noga_division <- as_tibble(
#  get_codelist(identifier = 'CL_NOGA_DIVISION', language = 'de'))

############### DEMO DSD_VALIDATOR ##################

devtools::install_git("https://bitbucket.bit.admin.ch/scm/bfs-fach/sis-sms-tools.git",
                      "DSDValidatoR", INSTALL_opts = c("--no-multiarch"))
library(DSDValidatoR)
library(validate)
data <- read.csv(file =
                   "Q:/groups/SIS/Pandas/ValidatoR/KD_GRSS_sample_with_error.csv", sep = ";")
id <- "DSI_GRSS"
show_validation_errors(data, id)

# Behind the scenes
rules <- generate_rules("DSI_GRSS")

out <- confront(data, rules)
summary(out)
plot(out)
violating(data, out)

