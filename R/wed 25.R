# dall = read.csv("D:/Masters 2015/Stats Assignment/DataCleaned1.csv", header=TRUE, sep=",")
retaildata=read.csv(file="D:/Masters 2015/Stats Assignment/DataCleaned1.csv", head=TRUE)

catA=unique(retaildata$Region_Name)
catAlen = length(catA)
catB=unique(retaildata$Flavour)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Flavour == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Region_Name == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
}    


#get into excel check qty then turn into function

for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
} 
  
chisq.test(testdata)
