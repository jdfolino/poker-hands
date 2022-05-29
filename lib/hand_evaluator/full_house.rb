# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class FullHouse < Base
    def correct?
      group_by_value.values.include?(3) &&
        group_by_value.values.include?(2)
    end
  end
end
