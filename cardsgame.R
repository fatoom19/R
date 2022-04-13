cards <- read.csv('cards.csv', header = TRUE)
View(cards)
#start coding 
##

shuffle <- function(cardssh){
  sample(cardssh)
  
}
#If you want to check shuffle function value :
#shuffeled<- shuffle(cards$X)
#shuffeled
#Second step Deal Function 

Deal<- function(n,players){
  shuffeled<- shuffle(n)
  if(players<=10){
    return(sample(shuffeled,5))
  }else{
    print("Players are more than 10, There are no enough cards")
  }}

player1<-Deal(cards$X,2)
player2<-Deal(cards$X,2)
p1<-c(player1)
print("Player one cards face and values:")
paste(cards$face[player1],cards$value[player1])
print("Player two cards face and values:")
paste(cards$face[player2],cards$value[player2])


#Trying Another Way to Deal Function (Additional)
players<- 2
Deal2<- function(n,players){
  shuffeled<- shuffle(n)
  if(players<=10){
    if(players==2){player1 <- data.frame(cards$face[shuffeled][0:5],cards$value[shuffeled][0:5])
    player2 <- data.frame(cards$face[shuffeled][6:10],cards$value[shuffeled][6:10])
    print(player1)
    print(player2)
    
    }else if(player==3){print("We can more here")}
    
    
  }else{
    print("Players are more than 10, There are no enough cards")
  }
}

p1<- Deal2(cards$X,players)
#Task 2
#Function gives me 5,7,10 cards based on players numbers
###########
#
deal_5_7_10 <- function(cards,players){
  shuffeled<- shuffle(cards)
  if(players==2){
  print(sample(cards,10))
    
  }else if(players==6){
    print(sample(cards,7))
    
  }else if(players==10){
    print(sample(cards,5))
  }
}

player1<-deal_5_7_10(cards$X,2)
player2<-deal_5_7_10(cards$X,2)
#part two of task 2
#Two players game:
Player_one_values<- sum(cards$value[player1])
Player_two_values<- sum(cards$value[player2])
highest_values<- function(p1,p2){
  if(p1>p2){
    sprintf("Player one has highes values that equals  %d, and player two has %d values",p1,p2)
  }else{
    sprintf("Player two has highes values that equals  %d,but player one has %d values",p2,p1)
  }
  
}
highest_values(Player_one_values,Player_two_values)