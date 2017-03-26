# t.tests looking at qty and values
#
#
#
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]


#hist(salesqty)
#x = sd(salesqty)
#hist(x)
#y=sd(retaildata$salesIncl)
#hist(y)
#summary(retaildata)
#tbl=table(retaildata$Manufacturer, retaildata$qty)
#chisq.test(tbl)

# null hypothysis is that the patern of qty sold will be the same 2009 and 2010 (Supported)
t.test(d2009$qty,d2010$qty)


c409=d2009[d2009$companyId != "Fascia 4",]
c410=d2010[d2010$companyId != "Fascia 4",]
t.test(c409$qty,c410$qty)

t.test(d2009$salesIncl,d2010$salesIncl)
# null hypothysis is that the patern of value sold including vat will be the same 2009 and 2010 (Unsupported)
t.test(d2009$salesExcl,d2010$salesExcl)
# null hypothysis is that the patern of value sold excluding vat will be the same 2009 and 2010 (Unsupported)

c109=d2009[d2009$companyId == "Fascia 1",]
c110=d2010[d2010$companyId == "Fascia 1",]
t.test(c109$salesIncl,c110$salesIncl)
c209=d2009[d2009$companyId == "Fascia 2",]
c210=d2010[d2010$companyId == "Fascia 2",]
t.test(c209$salesIncl,c210$salesIncl)
c309=d2009[d2009$companyId == "Fascia 3",]
c310=d2010[d2010$companyId == "Fascia 3",]
t.test(c309$salesIncl,c310$salesIncl)
c409=d2009[d2009$companyId == "Fascia 4",]
c410=d2010[d2010$companyId == "Fascia 4",]
t.test(c409$salesIncl,c410$salesIncl)

c409=d2009[d2009$companyId != "Fascia 4",]
c410=d2010[d2010$companyId != "Fascia 4",]
t.test(c409$salesIncl,c410$salesIncl)

unique(d9$companyId)


myttest = function(a, print=TRUE){
  cat(a, "\n")
  t09=d2009[d2009$sap_site == a,]
  t10=d2010[d2010$sap_site == a,]
  t.test(t09$salesIncl,t10$salesIncl)
}




#x10=length(list10)
#get a list of the stores that existed in 2009 and 2010
#
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$store_name)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$store_name == levels(stores_list)[i],]
  t10=d2010[d2010$store_name == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]

  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$salesIncl,t10$salesIncl)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
  
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$store_name)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$store_name == levels(stores_list)[i],]
  t10=d2010[d2010$store_name == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$salesExcl,t10$salesExcl)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)

dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$store_name)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$store_name == levels(stores_list)[i],]
  t10=d2010[d2010$store_name == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)


t.test(d2009$qty,d2010$qty)
t.test(d2009$salesExcl,d2010$salesExcl)
t.test(d2009$salesIncl,d2010$salesIncl)








if (r10 > 0){
  #p.value = t.test(t09$salesIncl,t10$salesIncl)$p.value
myttest(10,20)





storematrix=(1:x9+x10, ncol=2)
for (i in 1:x9) {
  rbind(storematrix, c())
  cat(i, "\n")
}
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$Region_Name)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$Region_Name == levels(stores_list)[i],]
  t10=d2010[d2010$Region_Name == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$Brand)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$Brand == levels(stores_list)[i],]
  t10=d2010[d2010$Brand == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$Custom.Hierachy_Type)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$Custom.Hierachy_Type == levels(stores_list)[i],]
  t10=d2010[d2010$Custom.Hierachy_Type == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

stores_list=unique(dall$Flavour)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$Flavour == levels(stores_list)[i],]
  t10=d2010[d2010$Flavour == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
#---

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

tbl2 = table(dall$Flavour,dall$Period)
tbl2
write.table(tbl2, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(tbl2)

#----------------------------------------------------------------------------------------------------------------------------------

dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
# rem   t09=d2009[d2009$Flavour == row.names(tbl)[i],]
#goodness of fit test 
catlist=unique(dall$Flavour)
x=length(catlist)
results = matrix(NA, nrow=x, ncol=5)
testtable = matrix(NA, nrow=x, ncol=2)
for (i in 1:x) {
  t09=d2009[d2009$Flavour == levels(catlist)[i],]
  t10=d2010[d2010$Flavour == levels(catlist)[i],]
  tot09 = sum(t09$qty)
  tot10 = sum(t10$qty)  
  results[i,]=c(i,levels(catlist)[i],tot09,tot10,-1)  
  testtable[i,]=c(tot09,tot10)  
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
chisq.test(testtable)

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
# rem   t09=d2009[d2009$Flavour == row.names(tbl)[i],]
#goodness of fit test 
catlist=unique(dall$Custom.Hierachy_Type)
x=length(catlist)
testtable = data.frame(NA, nrow=2, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Custom.Hierachy_Type == levels(catlist)[i],]} 
    else {t=d2010[d2010$Custom.Hierachy_Type == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
}
rownames(testtable) = c("2009","2010")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable)

#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Manufacturer)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Manufacturer == levels(catlist)[i],]} 
    else {t=d2010[d2010$Manufacturer == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval

}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Flavour)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Flavour == levels(catlist)[i],]} 
    else {t=d2010[d2010$Flavour == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Full.Description)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Full.Description == levels(catlist)[i],]} 
    else {t=d2010[d2010$Full.Description == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Week)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Week == levels(catlist)[i],]} 
    else {t=d2010[d2010$Week == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$store_name)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$store_name == levels(catlist)[i],]} 
    else {t=d2010[d2010$store_name == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$companyId)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$companyId == levels(catlist)[i],]} 
    else {t=d2010[d2010$companyId == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$store_group)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$store_group== levels(catlist)[i],]} 
    else {t=d2010[d2010$store_group == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---


#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Region_Name)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Region_Name== levels(catlist)[i],]} 
    else {t=d2010[d2010$Region_Name == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Country)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Country== levels(catlist)[i],]} 
    else {t=d2010[d2010$Country == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---

#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Manufacturer)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Manufacturer== levels(catlist)[i],]} 
    else {t=d2010[d2010$Manufacturer == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Brand)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Brand== levels(catlist)[i],]} 
    else {t=d2010[d2010$Brand == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#---
#---
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Custom.Hierachy_Type)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Custom.Hierachy_Type== levels(catlist)[i],]} 
    else {t=d2010[d2010$Custom.Hierachy_Type == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])

#------
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Size)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Size== levels(catlist)[i],]} 
    else {t=d2010[d2010$Size == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])

#------
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Flavour)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Flavour== levels(catlist)[i],]} 
    else {t=d2010[d2010$Flavour == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#------
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Full.Description)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Full.Description== levels(catlist)[i],]} 
    else {t=d2010[d2010$Full.Description == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])

#------
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Full.Description)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Full.Description== levels(catlist)[i],]} 
    else {t=d2010[d2010$Full.Description == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])
#-----------------------------------

dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Brand)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Brand== levels(catlist)[i],]} 
    else {t=d2010[d2010$Brand == levels(catlist)[i],]} 
    tot = sum(t$salesExcl)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])
#---------------------------

dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
catlist=unique(dall$Manufacturer)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Manufacturer== levels(catlist)[i],]} 
    else {t=d2010[d2010$Manufacturer == levels(catlist)[i],]} 
    tot = sum(t$salesExcl)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])


#
#
#


stores_list=unique(dall$Manufacturer)
x=length(stores_list)

results = matrix(NA, nrow=x, ncol=3)
for (i in 1:x) {
  t09=d2009[d2009$Manufacturer == levels(stores_list)[i],]
  t10=d2010[d2010$Manufacturer == levels(stores_list)[i],]
  r9=nrow(t09)
  r10=nrow(t10)
  store = levels(stores_list)[i]
  
  if (r9 > 0){
    if (r10 > 0){
      p.value = t.test(t09$qty,t10$qty)$p.value
    } else {p.value=-1} #N/A No 2010 values
  } else {p.value=-1} #N/A No 2009 values
  cat(i, "\n")
  results[i,]=c(i,store,p.value)
}
write.table(results, "clipboard", sep="\t", row.names=FALSE, col.names=FALSE)
#-----




dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

t09=d2009[d2009$Manufacturer == "Manufacturer 7",]
t10=d2010[d2010$Manufacturer == "Manufacturer 7",]


catlist=unique(t10$Brand)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=d2009[d2009$Brand== levels(catlist)[i],]} 
    else {t=d2010[d2010$Brand == levels(catlist)[i],]} 
    tot = sum(t$salesExcl)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
  if (testtable[1,i] > 0){
    if (testtable[2,i] > 0){
      pval = chisq.test(testtable[1:2,i])$p.value 
    } else {pval=-1} #N/A 
  } else {pval=-1} #N/A 
  testtable[3,i]=pval
  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])

#------


dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

t9_7=d2009[d2009$Manufacturer == "Manufacturer 7",]
t09=t9_7[t9_7$Brand == "Brand 6",]
t10_7=d2010[d2010$Manufacturer == "Manufacturer 7",]
t10=t10_7[t10_7$Brand == "Brand 6",]

catlist=unique(t09$Full.Description)
x=length(catlist)
testtable = data.frame(NA, nrow=3, ncol=x)
for (y in 1:2) {
  for (i in 1:x) {
    if (y == 1){t=t09[t09$Full.Description == levels(catlist)[i],]} 
    else {t=t10[t10$Full.Description == levels(catlist)[i],]} 
    tot = sum(t$qty)
    testtable[y,i]=tot 
  }
}

for (i in 1:x) {
  colnames(testtable)[i] <- levels(catlist)[i]
  
#  if (testtable[1,i] > 0){
#    if (testtable[2,i] > 0){
      #pval = chisq.test(testtable[1:2,i])$p.value 
#    } else {pval=-1} #N/A 
#  } else {pval=-1} #N/A 
#  testtable[3,i]=pval
#  
}

rownames(testtable) = c("2009","2010","p.value")
write.table(testtable, "clipboard", sep="\t", row.names=TRUE, col.names=TRUE)
chisq.test(testtable[1:2,])




write.table(t09, "D:/Masters 2015/Stats Assignment/temp1.csv", sep=",", row.names=TRUE, col.names=TRUE)



#-------------------------
dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]
t09=d2009[d2009$Manufacturer == "Manufacturer 10",]
t10=d2010[d2010$Manufacturer == "Manufacturer 10",]
m10qtot09=sum(t09$qty)
m10sitot09=sum(t09$salesExcl)
m10unitsale09=m10sitot09/m10qtot09

m10qtot10=sum(t10$qty)
m10sitot10=sum(t10$salesExcl)
m10unitsale10=m10sitot10/m10qtot10

t09=d2009[d2009$Manufacturer == "Manufacturer 7",]
t10=d2010[d2010$Manufacturer == "Manufacturer 7",]
m10qtot09=sum(t09$qty)
m10sitot09=sum(t09$salesExcl)
m10unitsale09=m10sitot09/m10qtot09

m10qtot10=sum(t10$qty)
m10sitot10=sum(t10$salesExcl)
m10unitsale10=m10sitot10/m10qtot10




#-------------------------
#to prove I can do functions 

unitpriceExcl = function(Manufacturer, Period){
  
  dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
  dyear = dall[dall$Period == Period,]
  t=dyear[dyear$Manufacturer == Manufacturer,]
  sumqty=sum(t$qty)
  sumsalesExcl=sum(t$salesExcl)
  result=sumsalesExcl/sumqty
  return(result)
}
unitpriceExcl("Manufacturer 7", "4 w/e 21 June,09")
unitpriceExcl("Manufacturer 7", "4 w/e 20 June,10")
unitpriceExcl("Manufacturer 10", "4 w/e 21 June,09")
unitpriceExcl("Manufacturer 10", "4 w/e 20 June,10")


#---------------------


dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned.csv", header=TRUE, sep=",")
dallman = dall[dall$Manufacturer == "Manufacturer 10",]
tbl2 = table(dallman$salesIncl,dallman$Period)

write.table(tbl2, "D:/Masters 2015/Stats Assignment/temp.csv", sep=",", row.names=TRUE, col.names=TRUE)

