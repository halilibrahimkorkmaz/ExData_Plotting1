# Setting up releveant data directory in to system;
data <- setwd("C:/Users/sk_mi/Desktop/Coursera/Exploratory Data Analysis/Week 1")

# Now we will read relevan data;
  data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Getting overall structure of the data;
  head(data)
  tail(data)
  str(data)
  
# Started clearing name row and unrelevant variables, casting to right classes
  data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

# Finally we will create plot;
  with(data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))