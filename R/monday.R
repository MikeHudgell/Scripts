


dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
d2009 = dall[dall$Period == "4 w/e 21 June,09",]
d2010 = dall[dall$Period == "4 w/e 20 June,10",]

t09=d2009[d2009$Manufacturer == "Manufacturer 10",]
t10=d2010[d2010$Manufacturer == "Manufacturer 10",]


catlist=unique(t09$Size)
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
}

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