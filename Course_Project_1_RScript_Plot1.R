setwd("~/Documents/Personal/Coursera/Exploratory Data Analysis")
library(readr)
household_power_consumption <- read_delim("~/Documents/Personal/Coursera/Exploratory Data Analysis/household_power_consumption.txt", ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),Time = col_time(format = "%H:%M:%S")),trim_ws = TRUE)
twodays <- household_power_consumption[household_power_consumption$Date >= "2007-02-01" & household_power_consumption$Date <= "2007-02-02",]
hist(twodays$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png", width = 480, height = 480)
dev.off()

