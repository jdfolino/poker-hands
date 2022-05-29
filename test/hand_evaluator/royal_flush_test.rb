# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/royal_flush'

describe HandEvaluator::RoyalFlush do
  describe '.correct?' do
    it 'returns true for a royal flush' do
      cards = %w[AH KH QH JH 0H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::RoyalFlush.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false if the suit is different cards' do
      cards = %w[AH KH QD JH 0H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::RoyalFlush.new(cards)
      _(rf.correct?).must_equal(false)
    end

    it 'returns false if the suit is the same but wrong values' do
      cards = %w[AH KH QH 2H 0H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::RoyalFlush.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
