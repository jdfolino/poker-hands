# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/one_pair'

describe HandEvaluator::OnePair do
  describe '.correct?' do
    it 'returns true for a 1 pairs of the same value' do
      cards = %w[AH 3C 3D 7H 2S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::OnePair.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false for only 0 pairs' do
      cards = %w[AH 2C 8D 6H 3S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::OnePair.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
