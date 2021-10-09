#Barplot with conditional color

rm(list=ls())

#working directory
setwd("G:/graph-gallery")

#Loading data
data<-read.csv("anomaly.csv",header=T) #Temperature anomaly data for India

library(dplyr)
library(ggplot2)

df <- data %>% 
  mutate(mycolor = ifelse(anomaly>0, "Red", "Blue"))

# plot
bplot<-ggplot(data, aes(x=year, y=anomaly)) +
  geom_bar(stat = "identity", fill= df$mycolor, width=0.7)+
  labs(x="Year", y= "Temperature anomaly")+
  theme_light() +
  theme(legend.position = "none")
ggsave(bplot, file="barplot.png", width=8, height=4,dpi=150,unit="in")