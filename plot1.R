
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

# aggregating data by year
data <- aggregate(NEI$Emissions, by = list(Year = NEI$year), sum);

# setting the range for y axis
lim <- lim <- c(0,max(data$x));

plot(data, type = "l", main = "Total emissions from PM2.5", ylab = "PM2.5 emissions", ylim=lim);

dev.copy(png, "plot1.png");

dev.off();