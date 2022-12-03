setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source('../Utils/getInput.R')
input = getInput(day=2)

strategyGuide = strsplit(trimws(input),'\n')[[1]]


# Part 1
roundScores = c(
  'A Y'=2+6,
  'A X'=1+3,
  'A Z'=3+0,
  'B Y'=2+3,
  'B X'=1+0,
  'B Z'=3+6,
  'C Y'=2+0,
  'C X'=1+6,
  'C Z'=3+3
)

result = Reduce(
  f=function(prior, round) {
    return(roundScores[[round]]+prior)
  },
  x= strategyGuide, 
  init = 0)

print(paste('Part 1 result:',result))

# Part 2

roundScores = c(
  'A Y'=1+3,
  'A X'=3+0,
  'A Z'=2+6,
  'B Y'=2+3,
  'B X'=1+0,
  'B Z'=3+6,
  'C Y'=3+3,
  'C X'=2+0,
  'C Z'=1+6
)

result = Reduce(
  f=function(prior, round) {
    return(roundScores[[round]]+prior)
  },
  x= strategyGuide, 
  init = 0)

print(paste('Part 2 result:',result))