##PLOT 3
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
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#Generate Plot #3
png(filename="plot3.png", width = 480, height = 480)
plot(Sub_metering_1 ~ Datetime, df, type = "l", ylim=c(0.0,40), xlab='', ylab="Energy sub metering")
par(new=T)
plot(Sub_metering_2 ~ Datetime, df, type = "l", ylim=c(0.0,40), xaxt = "n", col="red", xlab='', ylab='')
par(new=T)
plot(Sub_metering_3 ~ Datetime, df, type = "l", ylim=c(0.0,40), xaxt = "n", col="blue", xlab='', ylab='')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))
dev.off()
