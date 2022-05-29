# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class FourOfAKind < Base
    def correct?
      group_by_value.values.include?(4)
    end
  end
end
