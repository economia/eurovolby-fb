library(data.table)
library(jsonlite)
library(rFacebook)
library(ggplot2)

# načti data
fromJSON
strany  <- readLines("../data/postyStrany.json")
strany  <- fromJSON(strany)

lidri  <- readLines("../data/postyLidri.json")
lidri  <- fromJSON(lidri)

# filtruj data podel data
strany  <- lapply(strany, function(x) {x[as.Date(x$created_time) > as.Date("2012-01-01"), ]})
lidri  <- lapply(lidri, function(x) {x[as.Date(x$created_time) > as.Date("2012-01-01"), ]})

# počet příspěvků jednotlivě
sapply(strany, function (x) {
  return(nrow(x))
})

sapply(lidri, function (x) {
  return(nrow(x))
})

# počet příspěvků celkem

sum(sapply(lidri, function (x) {
  return(nrow(x))
}))

# počet fanoušků stran
fanousci  <- data.frame()

for (i in strany.seznam) {
  pocetFanousku  <- getUsers(i, token=fb_oauth)[1,c(2,9)]
  fanousci  <- rbind(pocetFanousku, fanousci)
}

fanousci  <- fanousci[order(fanousci$likes, decreasing=T),]

factor(fanousci$name)

dotplot  <- qplot(fanousci$likes, reorder(fanousci$name, fanousci$likes))
dotplot  <- dotplot + geom_point(size=2.5, colour="darkblue")
dotplot  <- dotplot + xlab("Počet fanoušků") + ylab("Název stránky")
dotplot  <- dotplot + ggtitle("Fanoušci stran na Facebooku v pátek 2. 5. 2014")
dotplot


# počet fanoušků a přátel kandidátů

kandidati.seznam  <- kandidati.seznam[complete.cases(kandidati.seznam),]$kandidat
kandidati.seznam  <- as.character(kandidati.seznam)

kandidati.seznam[17]

pratele  <- data.frame()

getUsers("ivan.bartos.37", token=fb_oauth)

test  <- getNetwork(kandidati.seznam[17], token=fb_oauth, format="adj.matrix")

dim(test)

for (i in kandidati.seznam) {
  pocetFanousku  <- getUsers(i, token=fb_oauth)[1,c(2,9)]
  pratele  <- rbind(pocetFanousku, pratele)
}

pratele

fanousci  <- fanousci[order(fanousci$likes, decreasing=T),]

factor(fanousci$name)

dotplot  <- qplot(fanousci$likes, reorder(fanousci$name, fanousci$likes))
dotplot  <- dotplot + geom_point(size=2.5, colour="darkblue")
dotplot  <- dotplot + xlab("Počet fanoušků") + ylab("Název stránky")
dotplot  <- dotplot + ggtitle("Fanoušci stran na Facebooku v pátek 2. 5. 2014")
dotplot
