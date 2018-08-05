NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore (fips=="24510") and Summing Emmisions by Year
baltimore <- NEI[which(NEI$fips == "24510"),]

vehicle_emmissions <- SCC[grep("*vehicle*|*Vehicle*",SCC$Short.Name),]$SCC
emmissions_in_baltimore <- baltimore[baltimore$SCC %in% vehicle_emmissions,]
#total vehicle emmissions in baltimore by year
total_vehicle_emmissions_baltimore <- aggregate(emmissions_in_baltimore$Emissions, list(emmissions_in_baltimore$year),mean)
total_vehicle_emmissions_baltimore
#plot vehicle emmissions in Baltimore by year
library(ggplot2)
g_veh_balt <- ggplot(total_vehicle_emmissions_baltimore, aes(x=Group.1, y=x, group =1)) + geom_point(aes(color = factor(Group.1)), size = 4)+geom_line()
g_veh_balt