require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'

puts "Welcome to Blackjack!"
puts ""

cards = Deck.new

player_cards = cards.deal(2)
dealer_cards = cards.deal(2)

player_hand = Hand.new(player_cards)
dealer_hand = Hand.new(dealer_cards)

score_player = player_hand.calculate_hand.to_i
score_dealer = dealer_hand.calculate_hand.to_i

puts "Player was dealt #{player_cards[0]}"
puts "Player was dealt #{player_cards[1]}"
puts "Player score: #{player_hand.calculate_hand.to_i}"
puts ""

while score_player <= 20
  puts "Hit or stand (H/S): "
  user_input = gets.chomp.downcase
  if user_input == "h"
    player_hand.hit(cards)
    puts "Player was dealt: #{player_hand.hand_cards[-1]}"
    score_player = player_hand.calculate_hand.to_i
    puts "Player Score: #{score_player}"
    if score_player > 21
      puts "Player score: #{score_player}"
      puts "Bust! You lose..."
      abort
    end
  else
    puts "Player Score: #{score_player}"
    break
  end
end

puts ""
puts "Dealer was dealt #{dealer_cards[0]}"
puts "Dealer was dealt #{dealer_cards[1]}"
puts "Dealer score: #{dealer_hand.calculate_hand.to_i}"

while score_dealer <= 17
  dealer_hand.hit(cards)
  puts ""
  puts "Dealer was dealt: #{dealer_hand.hand_cards[-1]}"
  score_dealer = dealer_hand.calculate_hand.to_i
  puts "Dealer score: #{score_dealer}"
  if score_dealer > 17 && score_dealer <= 21
    puts ""
    puts "Dealer stands."
  end
end

if score_player > score_dealer && score_player <= 21 && score_dealer <= 21
  puts ""
  puts "You win!"
elsif score_player == score_dealer
  puts ""
  puts "Push! That's a tie."
elsif score_dealer > 21
  puts ""
  puts "Dealer busts! You win!"
else
  puts ""
  puts "You lose..."
end
