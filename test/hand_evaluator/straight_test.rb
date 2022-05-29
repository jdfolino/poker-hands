# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/straight'

describe HandEvaluator::StraightFlush do
  # Ace can be high or low but not both.
  # Ace, 2, 3, 4, 5 is a straight.
  # 10, Jack, Queen, King, Ace is a straight.
  # Queen, King, Ace, 2, 3 is NOT a straight.

  describe '.correct?' do
    it 'returns true for a straight (Ace First)' do
      cards = %w[AH 2H 3H 4H 5H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Straight.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns true for a straight (Cards 2 - 6)' do
      cards = %w[2H 3H 4H 5H 6H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Straight.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns true for a straight (Ace Last)' do
      cards = %w[0H JH QH KH AH].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Straight.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns true if the suit is different cards' do
      cards = %w[AH KH QD JH 0H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Straight.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false if the suit is different but wrong values' do
      cards = %w[AH KD QH 2H 0H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Straight.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
