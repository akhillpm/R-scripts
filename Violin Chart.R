library(readxl)
library(ggplot2)
library(hrbrthemes)
library(tidyverse)
library(viridisLite)
library(viridis)
library(ggdark)
library(gganimate)
library(magick)


#Data Import
setwd("C:/Users/Amol Chavan/OneDrive - Johns Hopkins/AK_Onedrive/OneDrive - Johns Hopkins/Akhil/6. Others/2. HATHI Enrolments")
hathienr <- read_csv("C:/Users/Amol Chavan/OneDrive - Johns Hopkins/AK_Onedrive/OneDrive - Johns Hopkins/Akhil/1 HATHI/17 DSMB/Excel files/Projection/HATHIAProjection.csv")

View(hathienr)

hathienr=hathienr %>% filter(!is.na(enrolments)) %>% select(monthsl,monthyr,enrolments,cumulative_enrollments)

enrolment=hathienr %>%
  ggplot( aes(x=monthsl, y=cumulative_enrollments, group=monthsl, color=monthsl)) +
  geom_line() +
  geom_point(aes(group = monthsl)) +
  scale_color_viridis(discrete = FALSE) +
  labs(title = "HATHI Projection",
       subtitle = " ",
       caption = " ") +
  theme_minimal()+
  theme(panel.grid = element_blank())+
  ylab("Cumulative Enrolments") +
  transition_reveal(monthsl)

animate(enrolment, fps=8)


anim_save("C:/Users/Amol Chavan/OneDrive - Johns Hopkins/AK_Onedrive/OneDrive - Johns Hopkins/Akhil/6. Others/2. HATHI Enrolments/HATHI Enrolment Projection.gif",enrolment)
