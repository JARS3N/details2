parse_all <- function() {
  require(dplyr)
  target <- "/mnt/LSAG/Engineering/APPS ENG/MACHINE_VISION"
  source <- "/mnt/LSAG/Spotting/Logging"
  platforms <-grep("XFe|XFp", list.dirs(path = source, recursive = F),value=T)
  lots <- unlist(lapply(platforms, list.dirs, recursive = F))
  details2::save(lots,target)
}
