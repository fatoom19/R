library(tidyverse)
#Read
df<-read.csv("Life_Expectancy.csv")
View(df)
library(dplyr)
#Find null value
which(is.na(df))
df1<-df %>% na_if("")
#Eliminate all null values

df<- drop_na(df1)

View(df)
# checking data
summary(df)
# After checking data, it shows The minimum BMI equal to 1. Which doesn't make sense
# The lowest BMI that has ever recorded equals 7.5.(source:https://edinstitute.org/blog/2011/12/8/part-v-fat-no-more-fear-no-more-contempt)
DS<-df %>% filter(BMI >= 7.5)
df<- drop_na(DS)
#Visualization 
#I want to specify the relationship between Measles and The status of 
#the country developed or developing  
Developed_countries<-df %>% filter(Status == "Developed")
ggplot(data = Developed_countries, aes(Year,Measles)) +
  geom_bar(stat = 'summary',color = 'Black' )
#We can notice that the Measles was decreasing until 2010.
#In 2010 it increased in the developed countries.
#This increase can be because of the anti vaccination movements.
#LINK:https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6122668/
Developing_countries<-df %>% filter(Status == "Developing")
ggplot(data = Developing_countries, aes(Year,Measles)) +
  geom_bar(stat = 'summary',color = 'Blue' )
#We can notice that the Measles is decreasing 
#In 2005 it increased a little, then deceased 
#Comparing between developed and developing countries, we can see 
#the developed has lowest Measles Cases.


#############
#Second
#Visualization 
#The income and the Life.expectancy
ggplot(data = df) + 
  geom_point(mapping = aes(x = Income.composition.of.resources, y = Life.expectancy, colour = Status))
#Strong correlation between life expectancy and Human Development Index, Developed countries have higher Human Development Index
#Third
#Because we have compared between developed and developong cpuntries before 
# Schooling and Life.expectancy
ggplot(data = df) + 
  geom_point(mapping = aes(x = Year, y = Life.expectancy, colour = Schooling))
# As shown Schooling  positively affects the increase in life expectancy

#Forth
ggplot(data = df, aes(Year, infant.deaths)) +
  geom_bar(stat = 'summary', fill = '#9999CC' )+
  theme(panel.grid = element_blank(), panel.background = element_rect(fill = 'white'),
        axis.line.y = element_line(colour = "cadetblue4"),
        axis.line.x = element_line(colour = "cadetblue4"),)
#Trying to see the correlation between years and infant deaths
#Figure out that with last years the deaths has decreased 
#In the other hand, years between 2000 an 2005 infant deaths was higher than years 
#after 2007