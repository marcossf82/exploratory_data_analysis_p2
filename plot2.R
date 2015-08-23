
NEI <- readRDS("summarySCC_PM25.rds");

SCC <- readRDS("Source_Classification_Code.rds");

# subsetting the data for Baltimore City
data <- NEI[NEI$fips == "24510", ]

# aggregating data by year
data <- aggregate(data$Emissions, by = list(Year = data$year), sum);

# setting the range for y axis
lim <- lim <- c(0,max(data$x));

plot(data, type = "l", main = "Total emissions from PM2.5 for Baltimore City", ylab = "PM2.5 emissions", ylim=lim);

dev.copy(png, "plot2.png");

dev.off();