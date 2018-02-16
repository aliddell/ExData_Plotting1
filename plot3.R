# NOTE TO GRADERS
# In order to avoid repeating code across files, I've put my downloading/extracting/reading/manipulating code in `load_data.R`
# and sourced it in every script that generates a plot

source("load_data.R")                                                                       # adds power.df, dplyr, lubridate to workspace

png("plot3.png", width=480, height=480)                                                                            # initialize PNG graphics device
plot(power.df$Time, power.df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") # initialize plot with first line (Sub_metering_1)
lines(power.df$Time, power.df$Sub_metering_2, type="l", col='red')                          # add second line in red (Sub_metering_2)
lines(power.df$Time, power.df$Sub_metering_3, type="l", col='blue')                         # add third line in blue (Sub_metering_3)
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)                                                # display legend
dev.off()                                                                                   # close PNG device