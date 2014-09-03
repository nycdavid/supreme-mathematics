module SupremeMath
  class LinearFunction < Polynomial

    attr_reader :slope, :y_intercept

    def initialize(input)
      super
      raise ArgumentError, 'Invalid format for LinearFunction.' unless valid?
      @slope = terms.find { |term| term.base.value.is_a? String }.coefficient.value
      @y_intercept = terms.find { |term| term.base.value === 1 }.coefficient.value
    end

    private
      def valid?
        degree === 1
      end

  end
end
