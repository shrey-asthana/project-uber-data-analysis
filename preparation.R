# loading libraries

install.packages("tidyverse")
install.packages("ggthemes")
library(tidyverse)
library(DT)


# importing the dataset 
apr_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-apr14.csv", header = TRUE)
may_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-may14.csv", header = TRUE)
jun_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-jun14.csv", header = TRUE)
jul_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-jul14.csv", header = TRUE)
aug_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-aug14.csv", header = TRUE)
sep_data <- read.csv("D:/Work/Data Analytics/Projects/Uber Data Analysis/source_ris/uber-raw-data-sep14.csv", header = TRUE)



uber_data <- rbind(apr_data,may_data,jun_data,jul_data,aug_data,sep_data)
head(uber_data)


# basic summary stats

summary(uber_data)
skim_without_charts(uber_data)


# formatting the date time columns using lubridate

uber_data$Date.Time <- mdy_hms(uber_data$Date.Time)

summary(uber_data)
skim_without_charts(uber_data)


# adding month column to data set

uber_data <- uber_data %>% mutate(month = months(Date.Time)) 

month_order <- c("January", "February", "March", "April", "May", "June", "July", 
                 "August", "September", "October", "November", "December")

uber_data$month = factor(uber_data$month, levels = month_order) # month column changed to ordered factor



# adding hour column to data set

uber_data <- uber_data %>% mutate(start_hour = hour(Date.Time)) 

# adding day column to data set

uber_data <- uber_data %>% mutate(day_ride = day(Date.Time)) 

# creating day of week column

uber_data <- uber_data %>% mutate(dow_ride = wday(Date.Time, label = TRUE)) 



