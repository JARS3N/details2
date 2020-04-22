save <- function(j, target) {
  lapply(j, function(u) {
    df <- detals2::parse_dir(u)
    name <-   paste0(basename(dirname(u)),
                     "_",
                     basename(u),
                     "_machinevision_",
                     Sys.Date(),
                     ".csv")
    newpath <- file.path(target, name)
    write.csv(df, newpath, row.names = F)
  })
}
