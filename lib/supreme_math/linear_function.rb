module SupremeMath
  class LinearFunction < Polynomial

    attr_reader :slope, :y_intercept

    def initialize(input)
      super
      raise ArgumentError, 'Invalid format for LinearFunction.' unless valid?
      @slope = elements.find { |el| el.base === 'x' }.coefficient
      @y_intercept = elements.find { |el| el.base.nil? }.coefficient
    end

    private
      def valid?
        degree === 1
      end

  end
end
