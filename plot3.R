# Setting up releveant data directory in to system;
Power_data <- setwd("C:/Users/sk_mi/Desktop/Coursera/Exploratory Data Analysis/Week 1")

# Now we will read relevan data;
Power_data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Getting overall structure of the data;
head(Power_data)
tail(Power_data)
str(Power_data)

# started clearing name row and unrelevant variables, casting to right classes
Power_data <- Power_data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

# Now we will create plot;
with(Power_data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(Power_data, points(V1,V7, col="black", type="l"))
with(Power_data, points(V1,V8, col="red", type="l"))
with(Power_data, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))