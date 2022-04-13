library(tidyverse)
#Read
car_travel<-read.csv("C:\\Users\\Mujtaba\\Downloads\\Car_travel_times.csv")
View(car_travel)
install.packages(dplyr)
library(dplyr)
#Find null values
which(is.na(car_travel))
car_travel_na<-car_travel %>% na_if("")
#Replace Missing Values with NA
view(car_travel_na)
#All Null Values has been replaced by NA
#There is just two destination (Home and GSK)
# Separate date
car_travel <-car_travel_na %>% separate(Date, c("Month","Day","Year"),sep="/")

#Filter Null Values
car_travel_na<- car_travel %>% filter(!(is.na(car_travel$MaxSpeed)))
car_travel<- car_travel_na %>% filter(!(is.na(car_travel_na$Year)))
car_travel[is.na(car_travel)] <- 0 # Fill with zeros
car_travel_na<-car_travel
view(car_travel_na)
#VISUALIZATION
#Finding that the driver has his hiegst speed in 2012 (145)
#seems like unsafe driver 
hist(car_travel_na$MaxSpeed,
     main= "Max Speed",
     xlab = 'Speed Km/h',)

#second visualization 
#This visualization shows the details of the distance the driver had drived on 2011/2012
#By year
#We can conclude that the distance of the two years has no big difference.
boxplot(car_travel_na$Distance~car_travel_na$Year, main="Distance of Driving 2012/2011",horizontal = TRUE
        ,col="orange",border="black",
        xlab = "Years",
        ylab = "Distance")
#by month 
boxplot(car_travel_na$Distance~car_travel_na$Month, main="Distance of Driving by month",horizontal = TRUE,
        xlab = "Distance",
        ylab = "Month",
        col="orange",border="black")
#The distance based on month shows that the distance is always betwwen the ranve (45 and 55)

SS=aggregate(car_travel_na$TotalTime, by=list(Category=car_travel_na$Take407All), mean)

barplot(height = unlist(SS[2]), names.arg = (unlist(SS[1])),
        main= "Average Trip Time",
        xlab = "407 Toll was used",
        ylab = "Trip Duration",
        col=rgb(0.2,0.4,0.6,0.6) )
#Using 407 Toll on average saves 10 minutes


tab <- table(car_travel_na$Take407All, car_travel_na$GoingTo)
barplot(tab,
        main= "Toll Usage by Destination",
        xlab = "Destination",
        ylab = "Trips",
        legend = list('No','Yes'),
        beside = TRUE,
        col=c("#009999", "#0000FF") )

#The driver uses Toll mostly for going to work. That is usually because that the morning time consider a rush time.
#Usually when heading home he takes slower back routes to save costs.