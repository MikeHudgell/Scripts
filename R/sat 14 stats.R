dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

mean(dall$qty)
sd(dall$qty)
mean(d2009$qty)
sd(d2009$qty)
mean(d2010$qty)
sd(d2010$qty)
t.test(d2009$qty,d2010$qty)
t.test(d2009$salesExcl,d2010$salesExcl)
t.test(d2009$salesIncl,d2010$salesIncl)

mean(d2009$salesIncl)
mean(d2010$salesIncl)
sd(d2009$salesIncl)
sd(d2010$salesIncl)


mean(d2009$qty)
range(d2009$qty)
mean(d2010$qty)
range(d2010$qty)

mean(d2009$salesIncl)
range(d2009$salesIncl)
mean(d2010$salesIncl)
range(d2010$salesIncl)

tbl1 = table(dall$Period,dall$qty)
tbl1
write.table(tbl1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)


tbl2 = table(dall$salesIncl,dall$Period)
write.table(tbl2, "D:/Masters 2015/Stats Assignment/temp.csv", sep="\t", row.names=TRUE, col.names=TRUE)

tbl = table(dall$companyId,dall$qty)
tbl
chisq.test(tbl)

tbl1 = table(dall$companyId,dall$Manufacturer)
tbl1
write.table(tbl1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl1)

tbl2 = table(dall$Flavour,dall$Period)
tbl2
write.table(tbl2, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl2)



yflavour = read.csv("D:/Masters 2015/Stats Assignment/yoyflavour.csv", header=TRUE, sep=",")
y09 = table(yflavour$Flavour, yflavour$y2009)



y10 = dayflavour[dall$Period == "4 w/e 20 June,10",]
y09

tbl1 = table(dall$companyId,dall$Manufacturer)
tbl1
write.table(tbl1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(yflavour)



chisq.test(2009$flavour)
tbl1 = table(2009$flavour,add(2009$qty))
t9 = aggregate(d2009, by=list(d2009$Flavour,d2009$qty), FUN=sum, na.rm=TRUE)



