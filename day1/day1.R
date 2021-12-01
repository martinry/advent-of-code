
# https://adventofcode.com/2021/day/1

library(data.table)
library(magrittr)

setwd(rstudioapi::getActiveDocumentContext()[["path"]] %>%
  	sub(basename(.), "", .)) %>% cat("Work directory set to: ", ., sep = "\n")

# Part 1

res <- fread("input.txt")

res <- data.table("Input" = res$V1,
				  "Shifted" = c(NA, res$V1[-length(res$V1)]),
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