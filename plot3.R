
library(ggplot2);

NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

# subsetting the data for Baltimore City
data <- NEI[NEI$fips == "24510", ];

# aggregating data by year
data <- aggregate(data$Emissions, by = list(Year = data$year, Type = data$type), sum);

g <- ggplot(data, aes(Year, x, color = Type)) + geom_line() + ggtitle("Total emissions from PM2.5 for Baltimore City by Type") + ylab("PM2.5 emissions");

print(g);

dev.copy(png, "plot3.png");

dev.off();