# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../../lib/hand_evaluator/flush'

describe HandEvaluator::Flush do
  describe '.correct?' do
    it 'returns true for 5 cards of the same suit' do
      cards = %w[AH 2H 6H 8H 9H].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Flush.new(cards)
      _(rf.correct?).must_equal(true)
    end

    it 'returns false for 4 cards of the same suit' do
      cards = %w[AH 2H 6H 8H 9D].map { |s| Card.from_string(s) }
      rf = HandEvaluator::Flush.new(cards)
      _(rf.correct?).must_equal(false)
    end
  end
end
