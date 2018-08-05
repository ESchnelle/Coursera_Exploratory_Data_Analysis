NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Coal Emmissions
coal_emissions <- SCC[grep("*coal*|*Coal*",SCC$Short.Name),]$SCC
head(coal_emissions)
coal_use_emmissions <- NEI[NEI$SCC %in% coal_emissions,]
head(coal_use_emmissions)
sum_total_coal_emmissions <- aggregate(coal_use_emmissions, list(coal_use_emmissions$year), mean)
sum_total_coal_emmissions
#plot total US coal emmsions by year
library(ggplot2)
g2 <- ggplot(sum_total_coal_emmissions, aes(x=Group.1, y=Emissions, group =1)) + geom_point(aes(color = factor(Group.1)), size = 4)+geom_line()
g2