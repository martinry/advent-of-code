
library(data.table)
library(magrittr)

setwd("C:/Users/martinry/advent-of-code/day2/")

# Part 1

movement <- fread("input.txt")

names(movement) <- c("Move", "Amount")

movement <- movement[, sum(Amount), by = Move]

abs(movement[Move == "up"]$V1 - movement[Move == "down"]$V1) * movement[Move == "forward"]$V1

# Part 2

movement <- fread("input.txt")

names(movement) <- c("Move", "Amount")

aim <- 0
depth <- 0

move <- function(x){
    direction <- x["Move"]
    amount <- x["Amount"] %>% as.numeric
    
    switch(direction,
           forward = depth + (aim * amount) ->> depth,
           up = aim - amount ->> aim,
           down = aim + amount ->> aim)
}

invisible(apply(movement, 1, move))

movement <- movement[, sum(Amount), by = Move]

depth * movement[Move == "forward"]$V1
