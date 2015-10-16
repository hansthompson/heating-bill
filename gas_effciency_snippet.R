library(lubridate)
library(ggplot2)

gas <- read.csv("heating_data.csv")
date <- parse_date_time(paste(gas$month, gas$year), "%m*! %Y!")
gas$year <- factor(gas$year)
gas <- cbind(gas, date)

ggplot(data = gas, aes(x = mean_temp, y = use / days, color = energy_remodel)) + 
    geom_point(size = 3) + geom_smooth(method = "lm") + 
    labs(x= expression("Mean Monthly Temperature in "~degree*F), 
         y = "Mean daily ccf consumed", 
         title = "Natural Gas Consumption from Jan. 2011 to Oct. 2015") 

ggsave("remodel change in consumption.pdf")

summary(lm(data = gas, use/days ~ mean_temp + owner))


