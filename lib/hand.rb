require_relative 'deck'

class Hand

  attr_accessor :hand_cards

  def initialize(hand_cards)
    @hand_cards = hand_cards
  end

  def hit(deck)
    @hand_cards << deck.deal(1)
    @hand_cards.flatten!
  end

  def calculate_hand
    score = 0
    @hand_cards.each do |value|
      if value.include?('J') || value.include?('Q') || value.include?('K')
        score += 10
      elsif value.include?('A') && score < 11
        score += 11
      elsif value.include?('A') && score >= 11
        score += 1
      else
        score += value.to_f
      end
    end
    score
  end
end
