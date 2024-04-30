# checking span of data i.e. number of years recorded
uber_data %>% mutate(year_ride = year(Date.Time)) %>% count(year_ride, sort=TRUE) # data is of year 2014



# Trips in a month

uber_data %>% 
  ggplot(aes(x = month, fill= month)) + 
  geom_histogram(stat="count") +
  labs(x = "Day Of Week", y = "Frequency", title = "Total Rides Taken By Month")


# conducting hourly ride analysis

uber_data %>% group_by(start_hour) %>% 
  summarize(total = n())

uber_data %>% 
  ggplot(aes(x=start_hour, fill=month)) + 
  geom_histogram(stat="count") +
  scale_x_continuous(breaks = seq(0, 23, by = 1), limits = c(0, 23)) +
  labs(x = "Hour of the Day", y = "Frequency", title = "Total Rides Taken By Hour")


uber_data %>% 
  ggplot(aes(x=start_hour, fill=month)) + 
  geom_histogram(stat="count") +
  scale_x_continuous(breaks = seq(0, 23, by = 1), limits = c(0, 23)) +
  labs(x = "Hour of the Day", y = "Frequency", title = "Total Rides Taken By Hour") +
  facet_wrap(~month) 


# daily ride count analysis 

uber_data %>% 
  group_by(day_ride) %>% 
  mutate(total_day_ride = n()) %>% 
  ggplot(aes(x=day_ride, y= total_day_ride)) + 
  geom_line(alpha = 0.5, linewidth = 0.7,color="skyblue") +
  geom_smooth(se=FALSE,color="orange") +
  scale_x_continuous(breaks = 1:31, labels = 1:31) +
  labs(x = "Day of the Month", y = "Frequency", title = "Total Rides Taken By Day (All Months)")


uber_data %>% 
  group_by(day_ride) %>% 
  mutate(total_day_ride = n()) %>% 
  ggplot(aes(x=day_ride, y= total_day_ride,color=month)) + 
  geom_line(alpha = 0.7, linewidth = 0.3) +
  geom_smooth(se=FALSE) +
  scale_x_continuous(breaks = seq(1, 31, by = 1), limits = c(1, 31)) +
  labs(x = "Day of the Month", y = "Frequency", title = "Total Rides Taken By Day") +
  facet_wrap(~month) 


# day of week ride count analysis

uber_data %>% 
  ggplot(aes(x=dow_ride, fill=month)) + 
  geom_histogram(stat="count") +
  labs(x = "Day Of Week", y = "Frequency", title = "Total Rides Taken By Day of Week")


uber_data %>% 
  ggplot(aes(x=dow_ride, fill=month)) + 
  geom_histogram(stat="count") +
  labs(x = "Day of the Week", y = "Frequency", title = "Total Rides Taken By Day of Week") +
  facet_wrap(~month) 

# Heatmap - hour vs day across all months 
uber_data %>% 
  group_by(day_ride, start_hour) %>%
  summarize(trips = n()) %>% 
  ggplot(aes(x = day_ride , y = start_hour, fill = trips)) +
  scale_y_continuous(breaks = 0:23, labels = 0:23) +
  scale_x_continuous(breaks = 1:31, labels = 1:31) +
  geom_tile() + 
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(title = "Ride Intensity by Day and Hour", x = "Day", y = "Hour")
            


# Heatmap - month vs day across all months 
uber_data %>% 
  group_by(day_ride, month) %>%
  summarize(trips = n()) %>% 
  ggplot(aes(x = day_ride , y = month, fill = trips)) +
  scale_x_continuous(breaks = 1:31, labels = 1:31) +
  geom_tile() + 
  scale_fill_gradient(low = "yellow", high = "red") +
  labs( title = "Ride Intensity by Day and Month", x = "Day", y = "Month")


# Heatmap - month and weekday 

uber_data %>% 
  group_by(dow_ride, month) %>%
  summarize(trips = n()) %>% 
  ggplot(aes(x = dow_ride , y = month , fill = trips)) +
  geom_tile() + 
  scale_fill_gradient(low = "yellow", high = "red") +
  labs( title = "Ride Intensity by Day of Week and Month", x = "Day", y = "Month")







