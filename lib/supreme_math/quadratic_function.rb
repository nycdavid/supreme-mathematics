module SupremeMath
  class QuadraticFunction < Polynomial

    def initialize(input)
      super
      raise ArgumentError, 'Invalid format for QuadraticFunction.' unless valid?
    end

    def a
      @a ||= terms.max_by { |term| term.exponent.value }.coefficient.value
    end

    def b
      @b ||= terms.sort_by { |term| term.exponent.value }[1].coefficient.value
    end

    def c
      @c ||= terms.min_by { |term| term.exponent.value }.coefficient.value
    end

    def roots
      @roots ||= calculate_roots
    end

    private
      def valid?
        degree === 2
      end
      
      def calculate_roots
        [
          (-b + Math.sqrt(b**2 - 4*a*c)) / (2*a), 
          (-b - Math.sqrt(b**2 - 4*a*c)) / (2*a)
        ]
      end

  end
end
