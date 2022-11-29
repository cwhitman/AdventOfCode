library(httr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
session = paste(readLines("sessionToken.txt"))
downLoadFile = function(day) {
  return(content(GET(
    paste('https://adventofcode.com/2021/day/',as.character(day),'/input',sep=''), 
    add_headers(Cookie=paste('session=',session,sep='')))))
}


downLoadedFile = downLoadFile(2)

