library(data.table)
library(jsonlite)


strany  <- fromJSON("../data/postyStrany.json")
lidri  <- fromJSON("../data/postyLidri.json")

lidri  <- lapply(lidri, function(x) {x[as.Date(x$created_time) > as.Date("2012-01-01"), ]})


sapply(strany, function (x) {
  return(nrow(x))
})

sum(sapply(lidri, function (x) {
  return(nrow(x))
}))
