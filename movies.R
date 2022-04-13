# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack
# 2. Pretend you own multiple theaters and run two simulations to represent each theater and plot the results
# 3. Create conditional statements for movies that may be PG-13 and children are not allowed to watch

# Cost for adults and children
ticket_cost <- 15 
ticket_cost_child <- 7 
movies <- c('pride and prejudice', 'Get Out', 'Spider Man', 'Maleficent', 'A quiet place')  # List 5 of your favorite movies
screens <- 5 # How many screens does the theater have? (assume 1 per movie)
seats <- 50 # How many seats does each theater hold
week_days <- rep(0, 7)  # Store totals for each day
days <- c("Monday","Tuesday","Wendnsday","Thursday","Friday","Saturday","Sunday")
Total_revenue<-0
t<-0
# iterate through the week
for (d in 1:7){
  
  # Keep track of total revenue for the day
  t <- t+1
  revenue_each_day <- Total_revenue
  
  
  # iterate through the amount of screens on a particular day
  for (s in 1:50) {
    
    # Calculate  how many adults and children are watching the movie
    visitors_adults <- sample(50, 1)
    visitors_children <- sample((seats-visitors_adults),1)
    visitors<- visitors_adults+ visitors_children
    #print("The number of Visitors of each day")
    #print(visitors)
    
    # Calculate the revenue for adults and children

    revenue_adult <- (visitors_adults*ticket_cost)
    revenue_children <-(visitors_children*ticket_cost_child)
    # Calculate revenue, and add to running total for the day
    total_revenue<- revenue_adult+revenue_children
    

      
    }
  
  # Save total to the corresponding day
  week_days[t]<- total_revenue


  
}
Total_revenue_data_frame<-data.frame(week_days,days)
# Make a barchart showing total revenue per day
View(Total_revenue_data_frame)
barplot(as.integer(Total_revenue_data_frame$week_days),names.arg=days, main ="Revenue of Each Week Day"
        ,xlab = "Days", ylab="Revenue",col="darkblue",legend=(colnames(Total_revenue_data_frame$week_days)))

#summary(Total_revenue_data_frame)
# Make any other chart
boxplot(Total_revenue_data_frame$week_days, 
        ylab = 'Revenue of The Week',
        col = 'blue')


# Which day had the highest revenue? 

#Tuesday has highest Revenue