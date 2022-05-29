# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class OnePair < Base
    def correct?
      pairs.size == 1
    end
  end
end
