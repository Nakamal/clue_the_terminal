require_relative "card"

class Hand
  attr_accessor :cards
  def initialize(cards_array)
    @cards = []
    cards_array.each do |card_hash|
      @cards << Card.new(card_hash)
    end
  end

  def display
    puts "My Hand: "
    @cards.each do |card|
      puts "  • #{card.name}"
    end
  end
end