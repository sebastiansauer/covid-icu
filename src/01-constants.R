
# Overall flags -----------------------------------------------------------



#dataset <- "small"
dataset <- "real"

rerun_all <- FALSE
write_to_disk <- TRUE




# Data Paths -------------------------------------------------------------------


path_prefix_real <- "/Users/sebastiansaueruser/Google Drive/research/Covid19/covid-icu-old/"
path_prefix_small <- "./"

if (dataset == "small") path_prefix <- path_prefix_small
if (dataset == "real") path_prefix <- path_prefix_real

data_raw_path <- paste0(path_prefix, "data/raw/CovidDA_CA_randomisierte Version_bearbeitet230322.xlsx")

data_processed_path <- paste0(path_prefix, "data/processed/data-prepared.csv")


# Output Paths -------------------------------------------------------------------



rmdfile01 <- "01-preparing-the-data"
rmdfile02 <- "02-descriptive-analysis"
rmdfile03 <- "03-vis"
rmdfile04 <- "04-modelling"


# params <- list(dataset = "small")
# params <- list(dataset = NULL)



xgb01_outputfile <- paste0(path_prefix, "models/xgb01.rds")
logistic01_outputfile <- paste0(path_prefix, "models/logistic01.rds")
rf01_outputfile <- paste0(path_prefix, "models/rf01.rds")
final_rf_fit_file <-  paste0(path_prefix, "models/rf_final_01.rds")


figs_prefix_path <- paste0(path_prefix, "figs/")


# Particular variables ----------------------------------------------------


forbidden_vars <-c(
  "ns_hf",
  "niv",
  "beatmung_imv",
  "tod",
  "sepsis",
  "resp_insuff",
  "pneumonie_bakterielle_virale_fungale_superinfektion",
  "kardiale_beteiligung_tara_vhf_mi",
  "akutes_nierenversagen"
)



