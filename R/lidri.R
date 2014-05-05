library(data.table)

# získej data
kandidati.seznam  <- data.frame(kandidat=c("DanielKroupaOfficial",
                                    NA,
                                    "279044678939006",
                                    "abbartos",
                                    "svobodakdu",
                                    NA,
                                    "Niedermayer.Ludek",
                                    NA,
                                    "profil.paroubek",
                                    "konecna.k",
                                    NA,
                                    NA,
                                    NA,
                                    "jan.keller2014",
                                    "189032860155",
                                    NA,
                                    NA,
                                    NA,
                                    "zahradil",
                                    NA,
                                    "klarasamkova.cz",
                                    "liska.ondrej",
                                    "petrmach.cz",
                                    "rastislav.lucansky.1",
                                    NA,
                                    NA,
                                    "160116197332645",
                                    NA,
                                    "ottochaloupka",
                                    "ivan.bartos.37",
                                    "jana.volfova.777",
                                    NA,
                                    NA,
                                    NA,
                                    NA,
                                    "radekjohn.cz",
                                    NA), 
                         strana=c("SNK-ED",
                                  "Koal. SP a NO!",
                                  "KAN",
                                  "ND",
                                  "KDU-ČSL",
                                  "Rozumní",
                                  "TOP09",
                                  "LES",
                                  "LEV 21",
                                  "KSČM",
                                  "Evropani",
                                  "RSČMS",
                                  "HNPD",
                                  "ČSSD",
                                  "ANO 2011",
                                  "SRP",
                                  "M",
                                  "ČSR",
                                  "ODS",
                                  "VIZE",
                                  "Úsvit",
                                  "Zelení",
                                  "Svobodní",
                                  "RDS",
                                  "KSČ",
                                  "PB",
                                  "DSSS",
                                  "HSS",
                                  "Republika",
                                  "Piráti",
                                  "ČS",
                                  "KČ",
                                  "ANEO",
                                  "ČSNS",
                                  "O.K.strana",
                                  "VV",
                                  "OBČ_2011"
                                  ))

postyLidru  <- list()
counter <- 1

for (i in kandidati[complete.cases(kandidati),][,1]) {
  postyLidru[[i]]  <- getPage(i, token=fb_oauth, 4000)
  print(i)
  counter  <- counter + 1
}

# získej data
output <- lapply(postyLidru, data.table)
output  <- lapply(output, function(x) {x[as.Date(x$created_time) > as.Date("2013-05-01"), ]})

# ulož data
json  <- toJSON(output)
con  <- file("../data/postyLidri.json", "w")
writeLines(json, con)
close(con)