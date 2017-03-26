

retaildata=read.csv(file="D:/Masters 2015/Stats Assignment/DataCleaned1.csv", head=TRUE)
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Size)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Size == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)
#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Period)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Period == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata[1:2])

#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$weekEndDate)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$weekEndDate == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)
#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Promotion)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Promotion == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata[1:2])

#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Manufacturer)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Manufacturer == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)

#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$store_name)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$store_name == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  
write.table(testdata, file="d:/t.csv", sep=",", row.names=TRUE, col.names=TRUE)
chisq.test(testdata)
#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$company)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$company == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)
#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Brand)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Brand == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)

#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Custom.Hierachy_Type)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Custom.Hierachy_Type == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)

#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Flavour)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Flavour == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)
#
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$Full.Description)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$Full.Description == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)


#--------------------------
catA=unique(retaildata$Full.Description)
catAlen = length(catA)
catB=unique(retaildata$store_group)
catBlen=length(catB)

testdata = data.frame(NA, nrow =catAlen, ncol = catBlen)
for (column in 1:catBlen){
  d1=retaildata[retaildata$store_group == levels(catB)[column] ,]
  for (row in 1:catAlen){
    d2 = d1[d1$Full.Description == levels(catA)[row], ]
    tot = sum(d2$qty)
    testdata[row, column] = tot
  }  
} 
for (i in 1:catBlen) {
  colnames(testdata)[i] <- levels(catB)[i]
}  
for (i in 1:catAlen) {
  rownames(testdata)[i] <- levels(catA)[i]
}  

chisq.test(testdata)


#--------------------------