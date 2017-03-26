#--- Libraries
#
library(RODBC)
#
#--- Functions
#  
CleanMe = function(string){
  
  result = gsub("'","", string)
  
  return(result)
}
#
trim = function (x) gsub("^\\s+|\\s+$", "", x)
#
AstroSeason = function(ddate){
  
  day=as.integer(format(ddate,"%d"))
  month=as.integer(format(ddate,"%m")) 
  
  if((day>=4 && month ==2) || (month == 3 || month == 4) || (day<6 && month ==5)){Season=1}
  if((day>=6 && month ==5) || (month == 6 || month == 7) || (day<7 && month ==8)){Season=2}
  if((day>=7 && month ==8) || (month == 9 || month == 10) || (day<6 && month ==11)){Season=3}
  if((day>=6 && month ==11) || (month == 12 || month == 1) || (day<4 && month ==2)){Season=4}
  return(Season)
}
#
#
#
S_SQL = function(season){

  if(season==1){SQL = "1,0,0,0,0,0,1,0"}
  if(season==2){SQL = "0,1,0,0,0,0,0,1"}
  if(season==3){SQL = "0,0,1,0,1,0,0,0"}
  if(season==4){SQL = "0,0,0,1,0,1,0,0"}
  return(SQL)
}

#
#--- Initialise
#  
DWCon = odbcConnect("DW")  
StageCon = odbcConnect("DWStaging") 
#
#
# Main Flag State
#
#
SQL = "SELECT DISTINCT [flag] FROM [DWStaging].[dbo].[GeoWrecks] ORDER BY flag"
flag = as.data.frame(sqlQuery(StageCon, SQL))
for (f in 1:nrow(flag)){
  SQL = paste("INSERT INTO [DW].[dbo].[DimFlag] (FlagState) Values ('", flag[f,],"')")
  result = as.data.frame(sqlQuery(DWCon, SQL)) 
  cat(SQL, "\n")
}
#
#
# Main Type
#
#
SQL = "SELECT DISTINCT [type] FROM [DWStaging].[dbo].[GeoWrecks] ORDER BY type"
class = as.data.frame(sqlQuery(StageCon, SQL))
for (c in 1:nrow(class)){
  SQL = paste("INSERT INTO [DW].[dbo].[DimClass] (Class) Values ('", CleanMe(class[c,]),"')")
  result = as.data.frame(sqlQuery(DWCon, SQL)) 
  cat(SQL, "\n")
}

#
#
#--- Main Elevation
#
for (d in 0:20000000){
  feet = d*3.280839895
  SQL = paste("INSERT INTO [DW].[dbo].[DimElevation] (ID, Elevation, ElevationFeet) Values (", toString(d), ",", toString(d),",", toString(feet),")")
  result = as.data.frame(sqlQuery(DWCon, SQL))
  if(d%%1000==0){cat(d, "\n")}
}

#
#--- Main North Sea Elevation
#
for (d in 0:1000){
  feet = d*3.280839895
  SQL = paste("INSERT INTO [DW].[dbo].[DimElevationNS] (ID, Elevation, ElevationFeet) Values (", toString(d), ",", toString(d),",", toString(feet),")")
  result = as.data.frame(sqlQuery(DWCon, SQL))
  if(d%%1000==0){cat(d, "\n")}
}

#
#
#--- Main Time
#
for(hr in 0:23){
  for(mn in 0:59){
    for(sc in 0:59){
      # s_temp = toString(hr) 
      s_hr = formatC(hr, width=2, flag="0")
      s_mn = formatC(mn, width=2, flag="0")
      s_sc = formatC(sc, width=2, flag="0")
      stime = paste(s_hr,s_mn,s_sc,sep = ":")
      sql = paste("INSERT INTO DimTime (Time, Hour, Minute, Second, STime) VALUES ('", stime,"',", toString(hr),",",toString(mn),",",toString(sc),",'",stime,"')",sep = "")
      result = as.data.frame(sqlQuery(DWCon, sql))
      cat(sql, "\n")
    }
  }
}
#
#
#--- Main Date
#
sql1 = "INSERT INTO DimDate ([Date],[DayOfMonth],[MonthOfYear],[Year],[Quarter],[WeekOfYear],[MonthText],[DayOfWeek],[DayOfWeekText],[DayOfYearNum],[NorthSpring],[NorthSummer],[NorthAutumn],[NorthWinter],[SouthSpring],[SouthSummer],[SouthAutumn],[SouthWinter]) VALUES ('"
StartDate = as.Date("1754-01-01")
for(days in 0:97519){
  currDate = StartDate + days
  numDayofMonth=format(currDate,"%d")
  numMonthofYear=format(currDate,"%m")
  numWeekofYear=format(currDate,"%U")
  numWeekDay=format(currDate,"%w")
  numYear=format(currDate,"%Y")
  numDayofYear=format(currDate,"%j")
  
  dayofweek=format(currDate,"%A")
  month=format(currDate,"%B")
  quarter=quarters(currDate)
  season=AstroSeason(currDate)
  SeasonSQL = S_SQL(as.integer(season))
  
  sql = paste(sql1,toString(currDate),"',",numDayofMonth,",",numMonthofYear, ",",numYear,",'", quarter,"',",numWeekofYear,",'",month,"',",numWeekDay,",'",dayofweek,"',",numDayofYear,",",SeasonSQL,")",sep = "")
  result = as.data.frame(sqlQuery(DWCon, sql))
  cat(sql, "\n") 


}

#-------------------------------------------------------------------------------------------------------------------------
#
# test bed stuff

decimal = -0.0001

deg = dd_deg(decimal)
min = dd_min(decimal)
sec = dd_sec(decimal)
wholesec = dd_Wholesec(sec)
dimension="LONG"
if(sec < 0){
  secrange=wholesec-1
  if(dimension=="LAT"){
    SQL = paste("SELECT * FROM [DW].[dbo].[DimLatitude] where LatitudeDegree=", toString(deg), " and LatitudeMinute=", toString(min)," and (LatitudeSecond <= ", toString(wholesec)," and LatitudeSecond >= ", toString(secrange), ") order by LatitudeSecond ASC")
  } else {
    SQL = paste("SELECT * FROM [DW].[dbo].[DimLongitude] where LongitudeDegree=", toString(deg), " and LongitudeMinute=", toString(min)," and (LongitudeSecond <= ", toString(wholesec)," and LongitudeSecond >= ", toString(secrange), ") order by LongitudeSecond ASC")
  }
  
} else {
  secrange=wholesec+1
  if(dimension=="LAT"){
    SQL = paste("SELECT * FROM [DW].[dbo].[DimLatitude] where LatitudeDegree=", toString(deg), " and LatitudeMinute=", toString(min)," and (LatitudeSecond >= ", toString(wholesec)," and LatitudeSecond <= ", toString(secrange), ") order by LatitudeSecond ASC")
  } else {
    SQL = paste("SELECT * FROM [DW].[dbo].[DimLongitude] where LongitudeDegree=", toString(deg), " and LongitudeMinute=", toString(min)," and (LongitudeSecond >= ", toString(wholesec)," and LongitudeSecond <= ", toString(secrange), ") order by LongitudeSecond ASC")
  }  
}



result = as.data.frame(sqlQuery(DWCon, SQL))
key=result[which(abs(result[,5]-sec)==min(abs(result[,5]-sec))),1]
#key=result[which((result[,5]-sec)==min(result[,5]-sec)),1]
return(key)



