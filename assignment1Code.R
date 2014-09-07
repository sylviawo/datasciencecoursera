
# title: "ExplanatoryData 1"
# author: "Sylvia Wotus"
# date: "September 6, 2014"

##### Working directory #####

list.files()

library("DBI")
library("sqldf")

data <- read.csv.sql(file="household_power_consumption.txt",sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header=TRUE)
data[1:9,"?"]

summary(data)
str(data)
names(data)

data[1:5,]
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

#### Plot 1 ####

names(data)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab ="Frequency", main ="Global Active Power")

#### Plot 2 ####

data$Weekdays<-weekdays(data$Date)
length(data$Weekdays)
class(data$Weekdays)
length(data$Global_active_power)
plot(data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="", xaxt="n") # xaxt="n", remove the x axis notations
axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

#### Plot 3 ####

plot(data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", xaxt="n", col="black") # xaxt="n", remove the x axis notations
add(axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat")))
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"), bty ="n")

#### Plot 4 ####

par(mfrow=c(2,2))

plot(data$Global_active_power, type="l", ylab="Global_active_power", xlab="", main="", xaxt="n") # xaxt="n", remove the x axis notations
axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot(data$Voltage, type="l", xlab="datetime", ylab="Voltage",main="", xaxt="n") # xaxt="n", remove the x axis notations
axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

plot3 <- {plot(data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", xaxt="n", col="black")
          axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
          lines(data$Sub_metering_2, col="red")
          lines(data$Sub_metering_3, col="blue")
          legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),bty="n")}

plot(data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", main="", xaxt="n") # xaxt="n", remove the x axis notations
axis(side = 1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))

