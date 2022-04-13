# 10 dice 6 rolls:
sides_dice <- c(1:10)
roll_function <- function(sides){
  six_rolls <- sample(sides,6)
  print(sum(six_rolls))
  return(six_rolls)}
roll_function(sides_dice)
#Also, create 20 sided dice.
roll20_function <- function(){
  sixteen_rolls <- runif(16,1,20)
  print(sum(as.integer(sixteen_rolls)))
  return(as.integer(sixteen_rolls))}
roll20_function()
#Create another function to calculate how many dice
#rolled more than 6 (for the 10 sided) or 16 (for the 20 sided).:
larger_than_6 <-function(x){
  print(x)
  counter<-0
  for(i in x){
    if(i>=6){ 
      counter <- counter+1 
    }
  } 
  print(counter)
}
#Larger than 16 for 20
larger_than_16 <-function(x){
  print(x)
  counter<-0
  for(i in x){
    if(i>=16){ 
      counter <- counter+1 
    }
  } 
  print(counter)
}
ROLL10<-roll_function(c(1:10))
ROLL20<-roll20_function()
larger_than_6(ROLL10)
larger_than_16(ROLL20)