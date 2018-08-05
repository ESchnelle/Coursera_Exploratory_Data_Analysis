NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore (fips=="24510") and Summing Emmisions by Year
baltimore <- NEI[which(NEI$fips == "24510"),]
#Subset LA (fips=="06037") and Summing Emmisions by Year
Los_Angeles <- NEI[which(NEI$fips == "06037"),]

vehicle_emmissions <- SCC[grep("*vehicle*|*Vehicle*",SCC$Short.Name),]$SCC
emmissions_in_baltimore <- baltimore[baltimore$SCC %in% vehicle_emmissions,]
emmissions_in_la <- Los_Angeles[Los_Angeles$SCC %in% vehicle_emmissions,]

#total vehicle emmissions in baltimore by year
total_vehicle_emmissions_baltimore <- aggregate(emmissions_in_baltimore$Emissions, list(emmissions_in_baltimore$year),mean)
total_vehicle_emmissions_baltimore
total_vehicle_emmissions_baltimore$city <- rep("Baltimore",4)
total_vehicle_emmissions_baltimore
#total vehicle emmissions in LA by year
total_vehicle_emmissions_la <- aggregate(emmissions_in_la$Emissions, list(emmissions_in_la$year),mean)
total_vehicle_emmissions_la
total_vehicle_emmissions_la$city <- rep("Los Angeles",4)
total_vehicle_emmissions_la

#join cities together into one data frame
two_cities <- rbind.data.frame(total_vehicle_emmissions_baltimore,total_vehicle_emmissions_la)
two_cities

#plot vehicle emmissions in Baltimore by year
library(ggplot2)
g_veh_2cities <- ggplot(two_cities, aes(x=factor(Group.1), y=x, group=city)) + geom_point(aes(color=city), size = 4)+geom_line(aes(color=city))
g_veh_2cities
