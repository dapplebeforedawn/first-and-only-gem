require "first_and_only/version"

module Enumerable
  def first_and_only!
    fail(FirstAndOnly::CountNotOne.new) if first(2).count != 1
    first
  end

  module FirstAndOnly
    class CountNotOne < StandardError
      def initialize
        super("Expected the count to be 1.")
      end
    end
  end
end
