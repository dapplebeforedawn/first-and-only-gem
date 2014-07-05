require "first_and_only/version"

module Enumerable
  def first_and_only!
    fail(FirstAndOnly::LengthNotOne, count) if first(2).count != 1
    first
  end

  module FirstAndOnly
    LengthNotOne = Class.new(StandardError)
  end
end
