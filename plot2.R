# NOTE TO GRADERS
# In order to avoid repeating code across files, I've put my downloading/extracting/reading/manipulating code in `load_data.R`
# and sourced it in every script that generates a plot

source("load_data.R")                                                 # adds power.df, dplyr, lubridate to workspace

png("plot2.png", width=480, height=480)                                                      # initialize PNG graphics device
with(power.df,
     plot(Time, Global_active_power,
          type="l", xlab="", ylab="Global Active Power (kilowatts)")) # plot Global_active_power vs. Time as a line, with no x-label
dev.off()                                                             # close PNG device