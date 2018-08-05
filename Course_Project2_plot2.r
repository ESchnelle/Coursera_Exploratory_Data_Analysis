NEI <- readRDS("summarySCC_PM25.rds")
#Subset Baltimore (fips=="24510") and Summing Emmisions by Year
baltimore <- NEI[which(NEI$fips == "24510"),]
dim(baltimore)
#Total by Year for Baltimore
balt_totals <- aggregate(Emissions ~ year, baltimore, sum)
dim(balt_totals)
barplot(balt_totals$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "Baltimore PM2.5 Emission Totals 1999, 2002, 2005, 2008", names.arg = balt_totals$year)