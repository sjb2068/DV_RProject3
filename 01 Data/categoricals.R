myplot <- function(df, x) {
  names(df) <- c("x", "n")
  ggplot(df, aes(x=x, y=n)) + geom_point()
}

categoricals <- eval(parse(text=substring(gsub(",)", ")", getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from POPEST"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'True'), verbose = TRUE)), 1, 2^31-1)))

dff <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from POPEST"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

l <- list()
for (i in names(dff)) { 
  if (i %in% categoricals[[1]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\", count(*) n from POPEST group by \\\""i"\\\" "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_js64948', PASS='orcl_js64948', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON', i=i), verbose = TRUE)))
    p <- myplot(r,i)
    print(p) 
    l[[i]] <- p
  }
}

png("/Users/User/Documents/UT/Spring 2015/CS 329E Data Vis/DV_RProject3/00 Doc/categoricals.png", width = 50, height = 30, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 12)))   

print(l[[1]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:3))
print(l[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 4:6))
print(l[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:9))
print(l[[4]], vp = viewport(layout.pos.row = 1, layout.pos.col = 10:12))
print(l[[5]], vp = viewport(layout.pos.row = 2, layout.pos.col = 1:3))
print(l[[6]], vp = viewport(layout.pos.row = 2, layout.pos.col = 4:6))
print(l[[7]], vp = viewport(layout.pos.row = 2, layout.pos.col = 7:9))
print(l[[8]], vp = viewport(layout.pos.row = 2, layout.pos.col = 10:12))
print(l[[9]], vp = viewport(layout.pos.row = 3, layout.pos.col = 1:3))
print(l[[10]], vp = viewport(layout.pos.row = 3, layout.pos.col = 4:6))
print(l[[11]], vp = viewport(layout.pos.row = 3, layout.pos.col = 7:9))
print(l[[12]], vp = viewport(layout.pos.row = 3, layout.pos.col = 10:12))


dev.off()
