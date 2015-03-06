x <- dfjoininner %>% group_by(DIVISION) %>% summarize(average_population = mean(POPULATION_ESTIMATE), average_pop_change = mean(POPULATION_CHANGE), n=n()) %>% tbl_df
