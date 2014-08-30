module SupremeMath
  class Term
    attr_reader :coefficient, :base, :exponent

    def initialize(args)
      @coefficient = to_numeric(args[0])
      @base = args[1]
      @exponent = to_numeric(args[2])
    end

    private
      def to_numeric(string)
        string.to_i
      end
  end
end
