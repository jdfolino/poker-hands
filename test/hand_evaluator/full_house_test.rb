# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/full_house'

describe HandEvaluator::FullHouse do
  describe '.correct?' do
    it 'returns true for a two Aces and three 2s' do
      cards = %w[AH 2C 2D 2H AS].map { |s| Card.from_string(s) }
      rf = HandEvaluator::FullHouse.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false for a two Aces and two 2s' do
      cards = %w[AH 2C 3D 2H AS].map { |s| Card.from_string(s) }
      rf = HandEvaluator::FullHouse.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
