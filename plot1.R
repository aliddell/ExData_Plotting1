# NOTE TO GRADERS
# In order to avoid repeating code across files, I've put my downloading/extracting/reading/manipulating code in `load_data.R`
# and sourced it in every script that generates a plot

source("load_data.R")                                                                     # adds power.df, dplyr, lubridate to workspace

png("plot1.png", width=480, height=480)                                                                          # initialize PNG graphics device
with(power.df,
     hist(Global_active_power,
          col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")) # plot a histogram of Global_active_power with red bars
dev.off()                                                                                 # close PNG device