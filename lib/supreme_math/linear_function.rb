module SupremeMath
  class LinearFunction < Polynomial

    attr_reader :slope, :y_intercept

    def initialize(input, terms)
      super
      raise ArgumentError, 'Invalid format for LinearFunction.' unless valid?
      @slope = terms.variables[0].coefficient
      @y_intercept = terms.constant.value
    end

    private
      def valid?
        degree === 1
      end

  end
end
