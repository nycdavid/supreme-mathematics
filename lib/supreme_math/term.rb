module SupremeMath
  class Term
    attr_reader :coefficient, :base, :exponent

    REGEX = /\A(-?\d*|-?\d*\.\d+|-?\d*\/\d+?)(([A-Za-z]?)\^?(\d+|\d+\/\d+)?)\z/ 

    def initialize(input)
      @captures = REGEX.match(input).captures
      set_components
    end

    private
      def set_components
        @coefficient = SupremeMath::Coefficient.new(@captures[0])
        @base = SupremeMath::Base.new(@captures[2])
        @exponent = SupremeMath::Exponent.new(@captures[1], @captures[3])
      end

  end
end
