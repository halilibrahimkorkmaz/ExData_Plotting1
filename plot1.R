# Setting up releveant data directory in to system;
  data <- setwd("C:/Users/sk_mi/Desktop/Coursera/Exploratory Data Analysis/Week 1")

# Now reading relevant data
  data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Getting overall structure of the data;
  head(data)
  tail(data)
  str(data)

# Started clearing name row and unrelevant variables, creating numerics variables;
  data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# Finally we will create histogram;
  hist(data$V3, col = "red", main = "Global Active Power",
       xlab = "Global Active Power (killowatts)", ylab = "Frequency")