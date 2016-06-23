require "first_and_only/version"

module Enumerable
  def first_and_only!
    case first(2).count
    when 0
      fail FirstAndOnly::CountZero, FirstAndOnly::COUNT_ZERO_ERROR_MESSAGE
    when 1
      first
    else
      fail FirstAndOnly::CountGreaterThanOne, FirstAndOnly::COUNT_GREATER_THAN_ONE_ERROR_MESSAGE
    end
  end

  module FirstAndOnly
    CountNotOne = Class.new(StandardError)
    CountZero = Class.new(CountNotOne)
    CountGreaterThanOne = Class.new(CountNotOne)

    COUNT_ZERO_ERROR_MESSAGE = 'Expected the count to be 1, was 0.'.freeze
    COUNT_GREATER_THAN_ONE_ERROR_MESSAGE = 'Expected the count to be 1, was greater than 1.'.freeze
  end
end
