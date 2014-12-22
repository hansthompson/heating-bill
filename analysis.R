library(lubridate)
library(ggplot2)

dat <- read.csv("heating_data.csv")

date <- parse_date_time(paste(dat$month, dat$year), "%m*! %Y!")
dat$year <- factor(dat$year)
dat <- cbind(dat, date)

ggplot(data = dat, aes(x = mean_temp, y = use / days, color = energy_remodel))+ geom_point(size = 3) + geom_smooth(method = "lm", se = FALSE) + 
    labs(x= "Mean Temperature", 
         y = "Mean Ccf", 
         title = "Average energy consumtion over outside temperature") 

ggplot(data = dat, aes(x = date, y = use/days)) + geom_line() +
    labs(x= "Time", 
         y = "Mean Ccf", 
         title = "Gas useage in ccf over time") 



