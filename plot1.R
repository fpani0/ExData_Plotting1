##PLOT 1
#load data
df <- read.csv("household_power_consumption.txt", sep=';')

#Convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions
library(chron)
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- chron(times=df$Time)

#Filter data  
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
df <- df[df$Date >= DATE1 & df$Date <= DATE2,]
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_active_power <- df$Global_active_power / 1000

#Generate Plot #1
png(filename="plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", breaks=16, col="red")
dev.off()

