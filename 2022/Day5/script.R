setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source('../Utils/getInput.R')
require(stringr)
input = getInput(day=5)

matrixBoxes = do.call(rbind, strsplit(strsplit(strsplit(input,'\n\n')[[1]][1],'\n')[[1]],''))
boxes = as.list(as.data.frame(matrixBoxes[-nrow(matrixBoxes),rep(c(FALSE,TRUE,FALSE,FALSE),ncol(matrixBoxes)/4)]))
boxes = lapply(boxes,function(col){ return(rev(col[col != ' '])) })

moves = sapply(strsplit(strsplit(input,'\n\n')[[1]][2],'\n')[[1]],function(move){
  return(strtoi(str_match(move,'move ([:digit:]+) from ([:digit:]) to ([:digit:])')[-1]))
})

# Part 1

for(i in 1:ncol(moves)) {
  col = boxes[[moves[,i][2]]]
  print(col)
  print('mv')
  print(moves[,i][1])
  movedBoxes = rev(col[(length(col)-moves[,i][1]+1):length(col)])
  print(movedBoxes)
  
  boxes[[moves[,i][2]]] = boxes[[moves[,i][2]]][1:(length(col)-moves[,i][1])]
  boxes[[moves[,i][3]]] = c(boxes[[moves[,i][3]]],movedBoxes)
  
}

part1Result = paste(sapply(boxes,tail,1),collapse='')

paste("Part 1: ",part1Result)

# Part 2

boxes = as.list(as.data.frame(matrixBoxes[-nrow(matrixBoxes),rep(c(FALSE,TRUE,FALSE,FALSE),ncol(matrixBoxes)/4)]))
boxes = lapply(boxes,function(col){ return(rev(col[col != ' '])) })

for(i in 1:ncol(moves)) {
  col = boxes[[moves[,i][2]]]
  print(col)
  print('mv')
  print(moves[,i][1])
  movedBoxes = col[(length(col)-moves[,i][1]+1):length(col)]
  print(movedBoxes)
  
  boxes[[moves[,i][2]]] = boxes[[moves[,i][2]]][1:(length(col)-moves[,i][1])]
  boxes[[moves[,i][3]]] = c(boxes[[moves[,i][3]]],movedBoxes)
  
}

part2Result = paste(sapply(boxes,tail,1),collapse='')

paste("Part 2: ",part2Result)