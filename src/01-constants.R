
data_raw_path <- "/Users/sebastiansaueruser/Google Drive/research/Covid19/covid-icu-old/data/raw/CovidDA_CA_randomisierte Version_bearbeitet230322.xlsx"

data_raw_small_path <- "data/raw/d-raw-small.csv"


data_processed_path <- "/Users/sebastiansaueruser/Google Drive/research/Covid19/covid-icu-old/data/processed/"



rerun_all <- FALSE
write_to_disk <- FALSE


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



rmdfile01 <- "01-preparing-the-data"
rmdfile02 <- "02-descriptive-analysis"
rmdfile03 <- "03-vis"
