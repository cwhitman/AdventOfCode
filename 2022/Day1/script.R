setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source('../Utils/getInput.R')
input = downLoadFile(1)

calories = strtoi(strsplit(trimws(input),"\n")[[1]])

# First Problem
current_count = 0
maximum = 0
for(i in 1:length(calories)) {
  if(is.na(calories[i])) {
    if(current_count>maximum) {
      maximum=current_count
    }
    current_count=0
  } else {
    current_count = current_count + calories[i]
  }
}

print(maximum)

# Second Problem

current_count = 0
maximums = c(0,0,0)
for(i in 1:length(calories)) {
  if(is.na(calories[i])) {
    if(any(current_count > maximums)) {
      maximums[which.min(maximums)]=current_count
    }
    current_count=0
  } else {
    current_count = current_count + calories[i]
  }
}

print(sum(maximums))