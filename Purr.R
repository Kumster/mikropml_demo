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
View

