dall = read.csv("D:/Masters 2015/Stats Assignment/data1.csv", header=TRUE, sep=",")
d2009= read.csv("D:/Masters 2015/Stats Assignment/2009.csv", header=TRUE, sep=",")
d2010= read.csv("D:/Masters 2015/Stats Assignment/2010.csv", header=TRUE, sep=",")
mean(dall$qty)
sd(dall$qty)
mean(d2009$qty)
sd(d2009$qty)
mean(d2010$qty)
sd(d2010$qty)
t.test(d2009$qty,d2010$qty)
tbl = table(dall$companyId,dall$qty)
tbl
chisq.test(tbl)

tbl1 = table(dall$companyId,dall$Manufacturer)
tbl1
write.table(tbl1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl1)

tbl2 = table(dall$Flavour,dall$week)
tbl2
write.table(tbl2, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl2)
tbl3 = table(dall$Flavour,dall$Period)
tbl3
write.table(tbl3, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl3)
tbl4 = table(dall$Full.Description,dall$Period)
tbl4
write.table(tbl4, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl4)

tbl5 = table(dall$Description,dall$Period)
tbl5
write.table(tbl5, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl5)


tbl6 = table(dall$Like4Like.Stores_Type,dall$Period)
tbl6
write.table(tbl6, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl6)

tbl7 = table(dall$Volume,dall$Period)
tbl7
write.table(tbl7, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl7)

tbl8 = table(dall$Size,dall$Period)
tbl8
write.table(tbl8, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl8)

tbl9 = table(dall$Custom.Hierachy_Type,dall$Period)
tbl9
write.table(tbl9, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl9)


tbl10 = table(dall$Brand,dall$Period)
tbl10
write.table(tbl10, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl10)

tbl11 = table(dall$Manufacturer,dall$Period)
tbl11
write.table(tbl11, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl11)

tbl12 = table(dall$Country,dall$Period)
tbl12
write.table(tbl12, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl12)

tbl13 = table(dall$article,dall$Period)
tbl13
write.table(tbl13, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl13)
tbl14 = table(dall$store_name,dall$Period)
tbl14
write.table(tbl14, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl14)

tbl15 = table(dall$store_name,dall$qty)
tbl15
write.table(tbl15, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl15)


tbl16 = table(dall$T.Cat.Sales.09,dall$Period)
tbl16
write.table(tbl16, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl16)

tbl17 = table(dall$Brand,dall$Manufacturer)
tbl17
write.table(tbl17, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl17)


ctble = cbind(tbl[,Custom.Hierachy_Type], tbl[,Manufacturer])
ctble

tbl15 = table(dall$Period,dall$qty)
tbl15
write.table(tbl15, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl15)

tbl25 = table(dall$article,dall$qty)
tbl25
write.table(tbl25, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl25)

tbl100 = table(dall$sap_site,1)
tbl100
write.table(tbl100, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)

as.data.frame(table(dall$sap_site))
as.data.frame(table(dall$weekEndDate))
as.data.frame(table(dall$abarcode))
as.data.frame(table(dall$article))
as.data.frame(table(dall$salesIncl))
as.data.frame(table(dall$salesExcl))
as.data.frame(table(dall$vatamnt))
as.data.frame(table(dall$qty))
as.data.frame(table(dall$Bonus_buy))
as.data.frame(table(dall$Promotion))
as.data.frame(table(dall$bmc_descr))
as.data.frame(table(dall$Period))
as.data.frame(table(dall$Week))
as.data.frame(table(dall$store_name))
as.data.frame(table(dall$companyId))
as.data.frame(table(dall$store_group))
as.data.frame(table(dall$Region_Name))
as.data.frame(table(dall$Country))
as.data.frame(table(dall$Manufacturer))
as.data.frame(table(dall$Brand))
as.data.frame(table(dall$Custom.Hierachy_Type))
as.data.frame(table(dall$Size))
as.data.frame(table(dall$Volume.Equivalency))
as.data.frame(table(dall$Flavour))
as.data.frame(table(dall$Volume))
as.data.frame(table(dall$Like4Like.Stores_Type))
as.data.frame(table(dall$Full.Description))
as.data.frame(table(dall$T.Cat.Sales.09))
as.data.frame(table(dall$T.Cat.Sales.10))
as.data.frame(table(dall$Description))


q1=as.data.frame(table(dall$Flavour))
write.table(q1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
q2=as.data.frame(table(dall$Full.Description))
write.table(q2, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
q3=as.data.frame(table(dall$Description))
write.table(q3, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
              
dc = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
w1=as.data.frame(table(dc$Flavour))
write.table(w1, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
w2=as.data.frame(table(dc$Full.Description))
write.table(w2, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
w3=as.data.frame(table(dc$Description))
write.table(w3, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
