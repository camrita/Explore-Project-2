## Load the Libraries
library(ggplot2)

## Load the data

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimorenei <- (NEI[NEI$fips == "24510",])

## Create BarPlot and Export as PNG file

png(filename = "plot3.png",width = 750, height = 602,units = "px",)

g <- ggplot(data = baltimorenei, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_grid(facets = .~type,scales = "free",space = "free") +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(g)
dev.off()
