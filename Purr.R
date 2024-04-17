library(tidyverse)
map(1:5,sqrt)

map_dbl(1:5,sqrt)

sqrt(1:5)
sily_list <- list("foo",
                  1:5,
                  faithful,
                  TRUE
                  )
class(sily_list)
map_chr(sily_list,class)

DF <- faithful
glimpse(faithful)
view(DF)


faithful_chr <- faithful %>% map_df(as.character)
glimpse(faithful_chr)
View(faithful_chr)


filtered_faithful <- faithful %>%
  filter(eruptions > 3 & eruptions < 5)# Filter eruptions longer than 3 minutes and shorter than 5 minutes
glimpse(filtered_faithful)

avg_waiting <- faithful %>%  # the average waiting time
  summarize(avg_waiting = mean(waiting))
view(avg_waiting)

print(filtered_faithful)
print(avg_waiting)

faithful_long <- faithful %>%
  pivot_longer(cols = c(eruptions, waiting), names_to = "variable", values_to = "value")  # Pivot 'faithful' data to a longer format

print(faithful_long)


# Create a scatter plot of eruptions vs waiting times
plot <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point() +
  labs(title = "Eruptions vs. Waiting Time",
       x = "Eruption Duration (minutes)",
       y = "Waiting Time (minutes)") +
  theme_minimal()

print(plot)


grouped_faithful <- faithful %>%       # Find the eruption duration and waiting times grouped by minutes
  mutate(eruptions_min = floor(eruptions),
         waiting_min = floor(waiting)) %>%
  group_by(eruptions_min, waiting_min) %>%
  summarize(count = n()) %>%
  arrange(desc(count))

print(grouped_faithful)



























