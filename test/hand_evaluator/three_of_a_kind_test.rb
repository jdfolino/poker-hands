# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/three_of_a_kind'

describe HandEvaluator::ThreeOfAKind do
  describe '.correct?' do
    it 'returns true for a 3 of a kind' do
      cards = %w[AH 2C 2D 2H 4S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::ThreeOfAKind.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false for a 2 of a kind' do
      cards = %w[AH 2C 2D 3H 3S].map { |s| Card.from_string(s) }
      rf = HandEvaluator::ThreeOfAKind.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
