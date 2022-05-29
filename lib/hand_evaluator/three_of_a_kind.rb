# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class ThreeOfAKind < Base
    def correct?
      group_by_value.values.include?(3)
    end
  end
end
