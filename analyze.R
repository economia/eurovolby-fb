me  <- getUsers("me", token=fb_oauth)

my_friends  <- getFriends(token=fb_oauth)
my_friends_info <- getUsers(my_friends$id, token=fb_oauth, private_info=TRUE)
table(my_friends_info$relationship_status)


# nakresli graf mé sítě
my_network <- getNetwork(fb_oauth, format="adj.matrix")
singletons <- rowSums(my_network)==0 # friends who are friends with me alone

require(igraph)
my_graph <- graph.adjacency(my_network[!singletons,!singletons])
layout <- layout.drl(my_graph,options=list(simmer.attraction=0))
plot(my_graph, vertex.size=2, 
     #vertex.label=NA, 
     vertex.label.cex=0.5,
     edge.arrow.size=0, edge.curved=TRUE,layout=layout)
