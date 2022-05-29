# frozen_string_literal: true

require_relative '../ext/string'

module HandEvaluator
  class Base
    def initialize(cards)
      @cards = cards
    end

    def suits
      @cards.map(&:suit)
    end

    def values
      @cards.map(&:value)
    end

    def group_by_value
      values.each_with_object(Hash.new(0)) do |value, hash|
        hash[value] += 1
      end
    end

    def ace_first_order
      @cards.sort do |a, b|
        a.ace_first_pos <=> b.ace_first_pos
      end
    end

    def ace_last_order
      @cards.sort do |a, b|
        a.ace_last_pos <=> b.ace_last_pos
      end
    end

    def same_suit?
      suits.uniq.size == 1
    end

    def pairs
      group_by_value.values.select do |count|
        count == 2
      end
    end

    def straight?
      Card::AFSO.join('').include?(ace_first_order.map(&:value).join('')) ||
        Card::ALSO.join('').include?(ace_last_order.map(&:value).join(''))
    end

    def short_name
      self.class.to_s.sub('HandEvaluator::', '').underscore.upcase
    end
  end
end
