zvis <- melt (dfjoinself, id.vars="NAME", measure.vars = c("POPULATION_INCREASE", "INTERNATIONAL_MIG"))
z1 <- ggplot(zvis, aes(x=NAME, y=value, color=variable))+geom_bar(stat="identity")
z1 + xlab("State Name") + ylab("Population") + ggtitle("Population Increase and In ternational Migration by State") + scale_y_continuous(label = comma) +coord_flip()
ggsave(file="zvis.png", path="00 Doc")