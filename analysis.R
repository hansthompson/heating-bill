library(lubridate)
library(ggplot2)

gas <- read.csv("heating_data.csv")
date <- parse_date_time(paste(gas$month, gas$year), "%m*! %Y!")
gas$year <- factor(gas$year)
gas <- cbind(gas, date)

electric <- read.csv("electricity_usage.csv")
electric$Read.Date <- mdy(electric$Read.Date)

ggplot(data = electric, aes(x = mean_temp, y = use / days, color = energy_remodel)) + 
    geom_point(size = 3) + geom_smooth(method = "lm", se = FALSE) + 
    labs(x= "Mean Temperature", 
         y = "Mean Ccf", 
         title = "Average energy consumtion over outside temperature") 

electric_rate <- 0.149994
gas_rate <- 0.76891 + 0.1128

ggplot(data = electric, aes(x = Read.Date, y = electric_rate * KWH)) + 
    geom_bar(stat = "identity") +
    labs(x= "Time", 
         y = "Cost for Usage - $", 
         title = "Electric Cost At $0.14449/KWH") 

ggplot(data = gas, aes(x = mean_temp, y = use / days, color = energy_remodel)) + 
    geom_point(size = 3) + geom_smooth(method = "lm", se = FALSE) + 
    labs(x= "Mean Temperature", 
         y = "Mean Ccf", 
         title = "Average energy consumtion over outside temperature") 

ggplot(data = gas, aes(x = date, y = gas_rate * (use)), fill = owner) + 
    geom_bar(stat= "identity") +
    labs(x= "Time", 
         y = "Cost for Usage - $", 
         title = "Gas Cost at $0.88171/ccf") 