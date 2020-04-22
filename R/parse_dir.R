parse_dir<-function(DIR=choose.dir()){
  require(parallel);
  dirs<-list.dirs(DIR,recursive=F)
  FLS <-sapply(dirs,list.files,pattern="details.xml$",full.names=T)
  size.of.list <- length(FLS);
  cl <- makeCluster( min(size.of.list, detectCores()) );
  work<-parallel::parLapply(cl=cl,FLS,details2::attempt)
  Out<-dplyr::bind_rows(work)
  stopCluster(cl);
  Out
}
