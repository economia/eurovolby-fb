install.packages("data.table")
library(data.table)

strany  <- c("snked", "narodnidemokracie", "kducsl", "StranaZdravehoRozumu", "top09cz", "stranales.cz", "nslev21.cz", "komunistickastranacechamoravy", "RSCMAS", "cssdcz", "anobudelip", "moravaci", "ceskastranaregionu", "ods.cz", "VIZE2014", "hnutiusvit.cz", "stranazelenych", "svobodni", "rdscr", "ksc.cz", "117925194908879", "Antibursik", "197466333678437", "ceska.piratska.strana", "1401399660101451", "korunaceska.cz", "aktivnezavislychobcanu", "ceskastrananarodnesocialni", "OKstrana1", "veciverejne", "149047641828242")

postyStrany  <- list()
counter <- 1

for (i in strany[30:31]) {
  postyStrany[[i]]  <- getPage(i, token=fb_oauth, 4000)
  print(i)
  counter  <- counter + 1
}


# filtruj data

output  <- lapply(postyStrany, data.table)
output  <- lapply(output, function(x) {x[as.Date(x$created_time) > as.Date("2012-01-01"), ]})


# ulož data

save(postyStrany, file="postyStrany.R")

load("postyStrany.R")


library(jsonlite)
json  <- toJSON(posty)
con  <- file("posty.json", "w")
writeLines(json, con)
close(con)


postyStrany[[29]]
