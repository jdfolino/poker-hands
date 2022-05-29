# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class RoyalFlush < Base
    REQUIRED_VALUES = %w[0 J Q K A].freeze
    def correct?
      return false unless same_suit?

      REQUIRED_VALUES.all? do |required_value|
        values.include?(required_value)
      end
    end
  end
end
