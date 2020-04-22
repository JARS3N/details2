parse_all <- function() {
  target <- "/mnt/LSAG/Engineering/APPS ENG/MACHINE_VISION"
  source <- "/mnt/LSAG/Spotting/Logging"
  platforms <- list.dirs(path = source, recursive = F)
  lots <- unlist(lapply(platforms, list.dirs, recursive = F))
  details2::save(lots,target)
}
