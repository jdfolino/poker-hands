# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class StraightFlush < Base
    def correct?
      same_suit? && straight?
    end
  end
end
