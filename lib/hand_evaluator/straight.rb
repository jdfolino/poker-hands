# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class Straight < Base
    alias correct? straight?
  end
end
