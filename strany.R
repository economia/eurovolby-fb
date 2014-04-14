library(Rfacebook)

strany  <- c("snked", "narodnidemokracie", "kducsl", "StranaZdravehoRozumu", "top09cz", "stranales.cz", "nslev21.cz", "komunistickastranacechamoravy", "RSCMAS", "cssdcz", "anobudelip", "moravaci", "ceskastranaregionu", "ods.cz", "VIZE2014", "hnutiusvit.cz", "stranazelenych", "svobodni", "rdscr", "ksc.cz", "117925194908879", "Antibursik", "197466333678437", "ceska.piratska.strana", "1401399660101451", "korunaceska.cz", "nezavisliobcane", "ceskastrananarodnesocialni", "OKstrana1", "veciverejne", "149047641828242")

posty  <- list()
counter <- 1

for (i in strany) {
  posty[[counter]]  <- getPage(i, token=fb_oauth, 3000)
  print(counter)
  counter  <- counter + 1
}





