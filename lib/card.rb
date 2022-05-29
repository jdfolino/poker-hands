# frozen_string_literal: true

class Card
  SUITS = %w[S D H C].freeze
  ACE_FIRST_STRAIGHT_ORDER = %w[A 2 3 4 5 6 7 8 9 0 J Q K].freeze
  AFSO = ACE_FIRST_STRAIGHT_ORDER
  ACE_LAST_STRAIGHT_ORDER = %w[2 3 4 5 6 7 8 9 0 J Q K A].freeze
  ALSO = ACE_LAST_STRAIGHT_ORDER

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def shorthand
    "#{value}#{suit}"
  end

  def valid?
    ACE_FIRST_STRAIGHT_ORDER.include?(value) && SUITS.include?(suit)
  end

  def ace_first_pos
    ACE_FIRST_STRAIGHT_ORDER.find_index(value)
  end

  def ace_last_pos
    ACE_LAST_STRAIGHT_ORDER.find_index(value)
  end

  def ==(other)
    value == other.value && suit == other.suit
  end

  def self.from_string(string)
    raise 'Invalid String, must be 2 characters long' unless string.size == 2

    value, suit = string.split(//)
    Card.new(value, suit)
  end
end
