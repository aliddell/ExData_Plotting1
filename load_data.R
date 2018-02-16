library(dplyr)
library(lubridate)

data.file <- "household_power_consumption.txt"

## extract from archive if data file not found, downloading archive if necessary
if (!file.exists(data.file)) {
        zip.data <- "exdata_data_household_power_consumption.zip"
        if (!file.exists(zip.data)) {
                download.file("https://d396qusza40orc.cloupower.dfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              destfile=zip.data)
        }
        unzip(zip.data)
}

## load dataframe only if not in the workspace
if (!("power.df" %in% ls()) && !(all(dim(power.df) == c(2880, 9)))) {
        power.df <- tbl_power.df(read.table(data.file, sep=";", na.strings="?", header=T, stringsAsFactors=F))
        
        feb1 <- as.Date("2007-02-01")
        power.df$Date <- dmy(power.df$Date)
        power.df <- power.df %>% filter(Date %in% c(feb1, feb1+1))                  # filter out just 2007-02-01 and 2007-02-02
        
        # convert Time (string) to datetime object
        power.df$Time <- ymd_hms(paste(as.character(power.df$Date), power.df$Time)) # combine date and time columns to generate datetime
}