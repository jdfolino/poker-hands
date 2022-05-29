# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../lib/card'

describe Card do
  describe '.valid?' do
    it 'returns false if the suit is not valid' do
      _(Card.new('2', 'W').valid?).must_equal(false)
    end

    it 'returns false if the value is not valid' do
      _(Card.new('X', 'D').valid?).must_equal(false)
    end

    it 'returns true if the value and suit are valid' do
      _(Card.new('2', 'C').valid?).must_equal(true)
    end
  end

  describe '#from_string' do
    it 'returns a card' do
      _(Card.from_string('2H')).must_equal(Card.new('2', 'H'))
    end
  end

  describe '.ace_first_pos' do
    %w[A 2 3 4 5 6 7 8 9 0 J Q K].each_with_index do |value, expected_index|
      it "returns #{expected_index} as the position of the #{value} value" do
        _(Card.from_string("#{value}H").ace_first_pos).must_equal(expected_index)
      end
    end
  end

  describe '.ace_last_pos' do
    %w[2 3 4 5 6 7 8 9 0 J Q K A].each_with_index do |value, expected_index|
      it "returns #{expected_index} as the position of the #{value} value" do
        _(Card.from_string("#{value}H").ace_last_pos).must_equal(expected_index)
      end
    end
  end
end
