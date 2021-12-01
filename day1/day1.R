
# https://adventofcode.com/2021/day/1

library(data.table)
library(magrittr)

# Part 1

res <- fread("input.txt")$V1

res <- data.table("Input" = res,
				  "Shifted" = c(NA, res[-length(res)]),
				  "Increase" = NA)

res$Increase <- res$Input > res$Shifted
res[Increase == T, .N]

# Part 2

res <- fread("input.txt")

iter <- list()

for(i in 1:(res[, .N] - 2)){
	iter[[i]] <- res[i:(i+2)]$V1 %>% sum
}

iter %<>% unlist %>% data.table

res <- data.table("Input" = iter$.,
				  "Shifted" = c(NA, iter$.[-length(iter$.)]),
				  "Increase" = NA)

res$Increase <- res$Input > res$Shifted
res[Increase == T, .N]
