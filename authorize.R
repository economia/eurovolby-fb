library(Rfacebook)
library(Rook)
library(httpuv)

fb_oauth <- fbOAuth(app_id="290147534482698", app_secret="1a466f262e71962491737094bcc020e9")

save(fb_oauth, file="fb_oauth“)
