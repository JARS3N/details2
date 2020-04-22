try_null <- function(u) {
  tryCatch(
    details2::parse(u),
    error = function(e) {
      NULL
    },
    finally = message(u)
  )
}
