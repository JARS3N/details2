parse_dir<-function(DIR=choose.dir()){
  require(parallel);
  FLS <-list.files(path=DIR,recursive=T,full.names=T,pattern="details.xml$")
  size.of.list <- length(FLS);
  cl <- makeCluster( min(size.of.list, detectCores()) );
  work<-parallel::parLapply(cl=cl,FLS,deltails2::attempt)
  Out<-dplyr::bind_rows(work)
  stopCluster(cl);
  Out
}
