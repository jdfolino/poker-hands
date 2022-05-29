# frozen_string_literal: true

require_relative './base'

module HandEvaluator
  class Flush < Base
    alias correct? same_suit?
  end
end
