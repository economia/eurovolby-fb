library(data.table)
library(jsonlite)

strany  <- c("snked", "narodnidemokracie", "kducsl", "StranaZdravehoRozumu", "top09cz", "stranales.cz", "nslev21.cz", "komunistickastranacechamoravy", "RSCMAS", "cssdcz", "anobudelip", "moravaci", "ceskastranaregionu", "ods.cz", "VIZE2014", "hnutiusvit.cz", "stranazelenych", "svobodni", "rdscr", "ksc.cz", "117925194908879", "Antibursik", "197466333678437", "ceska.piratska.strana", "1401399660101451", "korunaceska.cz", "aktivnezavislychobcanu", "ceskastrananarodnesocialni", "OKstrana1", "veciverejne", "149047641828242")

#stáhni data
postyStrany  <- list()
counter <- 1

for (i in strany) {
  print(i)
  postyStrany[[i]]  <- getPage(i, token=fb_oauth, 4000)
  counter  <- counter + 1
}

# filtruj data
output  <- lapply(postyStrany, data.table)
output  <- lapply(output, function(x) {x[as.Date(x$created_time) > as.Date("2012-01-01"), ]})

# ulož data
json  <- toJSON(output)
con  <- file("../data/postyStrany.json", "w")
writeLines(json, con)
close(con)