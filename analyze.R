me  <- getUsers("me", token=fb_oauth)

my_friends  <- getFriends(token=fb_oauth)
my_friends_info <- getUsers(my_friends$id, token=fb_oauth, private_info=TRUE)
table(my_friends_info$relationship_status)
