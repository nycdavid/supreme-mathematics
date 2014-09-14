module SupremeMath
  class QuadraticFunction < Polynomial

    def initialize(input, term_collection)
      super
      raise ArgumentError, 'Invalid format for QuadraticFunction.' unless valid?
    end

    def a
      @a ||= terms.all.max_by { |term| term.exponent }.coefficient
    end

    def b
      @b ||= terms.all.sort_by { |term| term.exponent }[1].coefficient
    end

    def c
      @c ||= terms.constant.value
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
