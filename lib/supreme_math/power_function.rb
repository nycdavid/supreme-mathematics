module SupremeMath
  class PowerFunction < Function

    attr_reader :terms

    REGEX = /\A-?\d*\.?\d*[A-Za-z]\^(-1|1\/\d+)\z/
    @@regexes[REGEX] = self

    def initialize(input)
      @input = input
      @terms = [] << SupremeMath::Term.new(@input)
    end

  end
end
