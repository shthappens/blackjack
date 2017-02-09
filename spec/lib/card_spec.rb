require "spec_helper"

RSpec.describe Card do

  let(:card) { Card.new("10", "♥")}
	let(:seven_spades) { Card.new("7","♠")}
	let(:ace_spades) { Card.new("A","♠") }

  describe "#initialze" do
    it "should create a card" do
      expect(card).to be_a(Card)
	    expect(card.rank).to eq("7")
	    expect(card.suit).to eq("♥")
	  end
	end

  describe "#face_card?" do
    it "should return true for J, Q, K" do
	    expect(jack_spades.face_card?).to be true
	    expect(queen_diamonds.face_card?).to be true
	    expect(king_hearts.face_card?).to be true
	  end

	  it "should return false for any other ranks" do
	    expect(card.face_card?).to be false
	    expect(ace_spades.face_card?).to be false
	  end

	  it "should return true for Aces" do
	    expect(ace_spades.ace?).to be true
	  end

	  it "should return false for other ranks" do
	    expect(card.ace?).to be false
	    expect(king_clubs.ace?).to be false
	  end
	end

end
