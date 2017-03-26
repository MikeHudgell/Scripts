retaildata=read.csv(file="d:/data.csv", head=TRUE)
salesqty=retaildata$qty
salesweek=retaildata$weekEndDate
hist(salesqty)
x = sd(salesqty)
hist(x)
y=sd(retaildata$salesIncl)
hist(y)
summary(retaildata)
d10=retaildata[retaildata$Period == "4 w/e 20 June,10",]
d9=retaildata[retaildata$Period == "4 w/e 21 June,09",]
sales09=d9$qty
hist(sales09)
tbl=table(retaildata$Manufacturer, retaildata$qty)
chisq.test(tbl)

retaildata=read.csv(file="d:/data.csv", head=TRUE)
d10=retaildata[retaildata$Period == "4 w/e 20 June,10",]
d9=retaildata[retaildata$Period == "4 w/e 21 June,09",]
t.test(d9$qty,d10$qty)
t.test(d9$salesIncl,d10$salesIncl)
t.test(d9$salesExcl,d10$salesExcl)
c109=d9[d9$companyId == "Fascia 1",]
c110=d10[d10$companyId == "Fascia 1",]
t.test(c109$salesIncl,c110$salesIncl)
c209=d9[d9$companyId == "Fascia 2",]
c210=d10[d10$companyId == "Fascia 2",]
t.test(c209$salesIncl,c210$salesIncl)
c309=d9[d9$companyId == "Fascia 3",]
c310=d10[d10$companyId == "Fascia 3",]
t.test(c309$salesIncl,c310$salesIncl)
c409=d9[d9$companyId == "Fascia 4",]
c410=d10[d10$companyId == "Fascia 4",]
t.test(c409$salesIncl,c410$salesIncl)

c409=d9[d9$companyId != "Fascia 4",]
c410=d10[d10$companyId != "Fascia 4",]
t.test(c409$salesIncl,c410$salesIncl)

unique(d9$companyId)

for (i in 1:50) {
  cat(i, "\n")
}

mylist=unique(d9$companyId)



ggettheapprox item calvue by dividing units and sales values
