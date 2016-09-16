##PLOT 2
#load data
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
df$Datetime <- paste(df$Date, df$Time)

#Convert the Date Date/Time classes in R using the as.Date() function
#df$Datetime <- strptime(df$Datetime, "%d/%m/%Y %H:%M:%S")
df$Datetime <- as.POSIXct(df$Datetime, format="%d/%m/%Y %H:%M:%S", tz="AST")

#Filter data   
DATE1 <- as.POSIXct("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S", tz="AST") 
DATE2 <- as.POSIXct("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S", tz="AST") 
df <- df[df$Datetime >= DATE1 & df$Datetime <= DATE2,]
df$Global_active_power <- as.numeric(df$Global_active_power)

#Generate Plot #2
png(filename="plot2.png", width = 480, height = 480)
plot(Global_active_power ~ Datetime, df, xaxt = "n", type = "l", ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, df$Datetime, format="%a")
dev.off()
