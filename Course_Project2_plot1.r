NEI <- readRDS("summarySCC_PM25.rds")
#Totaling emissions by SCC and year
totals <- aggregate(Emissions ~ year,NEI, sum)
dim(totals)
totals
barplot(totals$Emissions, xlab="Year", ylab="PM2.5 Emissions", main = "PM2.5 Emission Totals by Year", names.arg = totals$year)