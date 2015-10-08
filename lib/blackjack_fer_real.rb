require 'pry'

def welcome
  puts "Welcome to the Blackjack Table. To win, you must have a higher hand than the dealer without going over 21."
end

def deal_card
  rand(1..11)
end

def dealer_hand(dealer_card)
  dealer_card + deal_card
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def display_dealer_card(dealer_card)
  puts "The dealer's visible card is worth #{dealer_card}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def deal_dealer
  dealer_card = deal_card
  display_dealer_card(dealer_card)
  dealer_hand(dealer_card)
end

def deal_user
  card_total = deal_card + deal_card
  display_card_total(card_total)
  card_total
end

def dealer_hit?(dealer_total)
  if dealer_total < 17
    dealer_total += deal_card
  end
  dealer_total
end

def hit?(card_total)
  prompt_user
  user_input = get_user_input
  while user_input != 'h' && user_input != 's'
    puts "Please enter a valid command. Type 'h' to hit or 's' to stay"
    user_input = gets.chomp
  end 
  if user_input == "h"
    card_total += deal_card
  end
  return card_total, user_input
end

def end_game(card_total, dealer_total)
  if card_total > 21 
    puts "You went bust!"
  elsif card_total <= 21 && (card_total > dealer_total || dealer_total > 21)
      puts "You won!"
  elsif card_total == dealer_total
    puts "You tied with the dealer!"
  elsif card_total < dealer_total && dealer_total <= 21
    puts "You lost! The dealer got closer to 21 than you did."
  end
  puts "You hit #{card_total} and the dealer hit #{dealer_total}. Thanks for playing!"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  dealer_total = deal_dealer
  card_total = deal_user
  if card_total == 21
    puts "Woah! Lucky kid. You got a blackjack!"
  end
  until card_total >= 21
    card_total, user_input = hit?(card_total)
    break if user_input == 's'
    display_card_total(card_total)
    dealer_total = dealer_hit?(dealer_total)
  end
  end_game(card_total, dealer_total)
end
    
