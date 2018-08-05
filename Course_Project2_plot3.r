NEI <- readRDS("summarySCC_PM25.rds")
#Subset Baltimore (fips=="24510") and Summing Emmisions by Year
baltimore <- NEI[which(NEI$fips == "24510"),]
dim(baltimore)
#Total by Year by Type for Baltimore
balt_sum_type_by_year <- aggregate(baltimore$Emissions, list(baltimore$type, baltimore$year),mean)
dim(balt_sum_type_by_year)
balt_sum_type_by_year
#plot Baltimore by Type by Year
library(ggplot2)
g <- ggplot(balt_sum_type_by_year, aes(y=x, x=Group.2))+geom_point(aes(color = factor(Group.1)), size = 4)
g+geom_line(aes(group=Group.1,colour=Group.1))
