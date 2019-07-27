# gganimate
# https://gganimate.com/index.html

install.packages("gganimate")
install.packages("gifski")
library(ggplot2)
library(gganimate)
library(gifski)
ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_boxplot() +
  # gganimate code
  gganimate::transition_states(
    gear,
    transition_length = 2,
    state_length = 1
  )+
  enter_fade() +
  exit_shrink() +
  ease_aes('sine-in-out')
)
