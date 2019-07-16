

library(fullercalendar)
data = data.frame(title = paste("Event", 1:4),
                 start = c("2019-07-11", "2019-07-13", "2019-07-15","2019-07-18T08:30+12:00"),
                 end = c("2019-07-12", "2019-07-14", "2019-07-17", "2019-07-18T12:30+12:00"),
                 color = c("red", "blue", "green", "blue"))
fullercalendar(events =  data)
