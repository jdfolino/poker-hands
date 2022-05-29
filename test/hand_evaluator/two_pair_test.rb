# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/two_pair'

describe HandEvaluator::TwoPair do
  describe '.correct?' do
    it 'returns true for a 2 different pairs of the same value' do
      cards = %w[AH 3C 3D 2H 2S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::TwoPair.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false for only 1 pair' do
      cards = %w[AH 2C 2D 6H 3S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::TwoPair.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
