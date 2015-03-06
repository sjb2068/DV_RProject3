yvis <- melt (y, id.vars="NAME", measure.vars = c("BIRTHS", "DEATHS"))
y1 <- ggplot(yvis, aes(x=NAME, y=value, color=variable))+geom_bar(stat="identity")
y1 + xlab("State Name") + ylab("Population") + ggtitle("Births and Deaths by State") + scale_y_continuous(label = comma) +coord_flip()
ggsave(file="yvis.png", path="00 Doc")