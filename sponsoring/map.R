library(maps)
library(ggplot2)
library(dplyr)

events <- tribble(
  ~ place, ~ lat, ~ long, ~year,
  "Budapest",47.497912, 19.040235, 2016,
  "Cape Town",-33.924869, 18.424055, 2018,
  "Puerto Rico",18.220833, -66.590149, 2017,
  "Cardiff",51.481581, -3.179090, 2018,
  "Amsterdam",52.370216, 4.895168, 2018,
  "Belgrade",44.786568, 20.448922, 2018,
  "Washington",38.907192, -77.036871, 2018,
  "Santiago", -33.4378, -70.6505, 2018,
  "Paris", 48.8566, 2.3522, 2019,
  "Johannesburg", -26.1633, 28.0328, 2019,
  "Newcastle", 54.9732, -1.6139, 2019,
  "Los Angeles", 34.0522, -118.2436, 2019,
  "Chicago", 41.8500, -87.6500, 2019,
  "Gdansk", 54.3520, 18.6463, 2019, 
  "Kampala", 0.3475, 32.5825, 2019, 
  "Berlin", 52.5243, 13.4105, 2019
)
map <- map_data("world") %>% 
  ggplot(aes(long, lat, group=group)) +
  geom_polygon(fill="white", colour="gray") +
  geom_point(data = events, aes(long, lat, group = NULL, colour = as.factor(year)), 
             size = 2) + 
  guides(fill=FALSE) +
  coord_quickmap() +
  theme_void() +
  theme(legend.title = element_blank(), legend.position="bottom")