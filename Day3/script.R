input = getInput(day=3)
rucksacks = strsplit(input,"\n")[[1]]
priorities = c(letters,LETTERS)

# Part 1

part1Rucksacks = lapply(rucksacks,function(rucksack){
  firstCompartment = strsplit(substring(rucksack,1,nchar(rucksack)/2),'')[[1]]
  secondCompartment = strsplit(substring(rucksack,nchar(rucksack)/2+1,nchar(rucksack)),'')[[1]]
  return(list(firstCompartment,secondCompartment))
})

part1Result = Reduce(
  function(prior,rucksack){
    return(prior+which(intersect(rucksack[[1]],rucksack[[2]])==priorities))
  },
  part1Rucksacks,
  0)

print(paste('Part 1:',part1Result))

# Part 2

part2Rucksacks = matrix(rucksacks,nrow=length(rucksacks)/3,ncol=3,byrow=TRUE)

part2Result = sum(apply(part2Rucksacks,1,function(row){
  badge = Reduce(intersect,strsplit(row,''))
  return(which(badge==priorities))
}))

print(paste('Part 2', part2Result))