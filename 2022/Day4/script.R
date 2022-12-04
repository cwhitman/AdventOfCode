setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source('../Utils/getInput.R')
input = getInput(day=4)

# Forgive me
assignments = matrix(sapply(sapply(sapply(strsplit(input,'\n'), strsplit,','),strsplit,'-'),strtoi),ncol=4,byrow=TRUE)

# Part 1

resultPart1 = sum(apply(assignments,
               1,
               function(row){
                 row = c(row[1:2],NA,row[3:4])
                 maximum_indexes = sort(which(max(row,na.rm=TRUE) == row))
                 minimum_indexes = sort(which(min(row,na.rm=TRUE) == row))

                 return(any(sapply(maximum_indexes,'-',minimum_indexes) == 1))
               }))

print(paste('Part 1',resultPart1))

# Part 2

resultPart2 = sum(!apply(assignments,
                        1,
                        function(row) {
                          return(row[2] < row[3] | row[4] < row[1])
                        }))
print(paste('Part 2', resultPart2))