module SupremeMath
  class PowerFunction < Function

    attr_reader :terms

    def initialize(input, term_collection)
      @input = input
      @terms = term_collection
    end

  end
end
