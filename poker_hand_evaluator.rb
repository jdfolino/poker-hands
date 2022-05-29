# frozen_string_literal: true

# Evaluates poker hands for validity and determines the winning hand

require_relative './lib/card'
require_relative './lib/ext/string'
require_relative './lib/hand_evaluator/flush'
require_relative './lib/hand_evaluator/four_of_a_kind'
require_relative './lib/hand_evaluator/full_house'
require_relative './lib/hand_evaluator/one_pair'
require_relative './lib/hand_evaluator/royal_flush'
require_relative './lib/hand_evaluator/straight_flush'
require_relative './lib/hand_evaluator/straight'
require_relative './lib/hand_evaluator/three_of_a_kind'
require_relative './lib/hand_evaluator/two_pair'
require_relative './lib/hand_evaluator/high_card'

class PokerHandEvaluator
  EVALUATORS = [
    HandEvaluator::RoyalFlush,
    HandEvaluator::StraightFlush,
    HandEvaluator::FourOfAKind,
    HandEvaluator::FullHouse,
    HandEvaluator::Flush,
    HandEvaluator::Straight,
    HandEvaluator::ThreeOfAKind,
    HandEvaluator::TwoPair,
    HandEvaluator::OnePair,
    HandEvaluator::HighCard
  ].freeze

  class InvalidHandError < StandardError
  end

  def initialize(hands)
    @hands = hands.map do |hand|
      hand.split(' ').map { |card| Card.from_string(card) }
    end
    validate_hands!
  end

  def hand_classifications
    evaluations = @hands.map do |hand|
      EVALUATORS.find do |evaluator|
        evaluator.new(hand).correct?
      end
    end

    evaluations.map do |evaluation|
      evaluation.new(@hands).short_name
    end
  end

  private

  def validate_hands!
    raise InvalidHandError unless @hands.all? { |hand| hand.size == 5 }

    shorthands = @hands.flatten.map(&:shorthand)
    raise InvalidHandError unless shorthands.uniq.size == shorthands.size
  end
end
