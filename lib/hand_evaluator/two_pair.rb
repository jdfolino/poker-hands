# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class TwoPair < Base
    def correct?
      pairs.size == 2
    end
  end
end
