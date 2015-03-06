xvis <- melt (x, id.vars="DIVISION", measure.vars = c("average_population", "average_pop_change"))
x0 <- xvis %>% arrange(DIVISION)
x0 = x0[-1,]
x0 = x0[-1,]
x1 <- ggplot(x0, aes(x=DIVISION, y=value, color=variable))+geom_point()
x1 + xlab("Division") + ylab("Population") + ggtitle("POPULATION CHANGE BY DIVISION") + scale_y_continuous(label = comma)
ggsave(file="xvis.png", path="00 Doc")