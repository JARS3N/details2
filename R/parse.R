parse<-function (xml){
  require(XML)
  d<-XML::xmlTreeParse(xml, useInternalNodes = T)  
  barcode <- details::get_barcode(d)
  tbl <- details::find_table(d)
  html_tree <- XML::htmlTreeParse(tbl, useInternalNodes = T)
  tds <- xpathApply(html_tree, path = "//td")
  strs <- xmlApply(tds, getChildrenStrings, len = 60)
  dfs <-lapply(strs, details2::pull_cells) %>%  dplyr::bind_rows()
  dfmeta<-data.frame(
    Lot=paste0(substr(barcode, 1, 1), substr(barcode,7, 11)),
    sn = substr(barcode, 2, 6),
    plat=  details::get_platform(substr(barcode, 1, 1))
  )
  dplyr::bind_cols(list(dfmeta,dfs))
}
