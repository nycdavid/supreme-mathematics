module SupremeMath
  class ExpressionString
    attr_reader :elements

    def initialize(elements)
      @elements = elements
    end

    def read
      @expression ||= convert
    end

    def convert
      @elements.each_with_index.map { |el, i| convert_coefficient(el.coefficient, i) + convert_exponent(el.exponent) }.join
    end

    def convert_coefficient(el, i)
      case el
      when 1
        ''
      else
        if i != 0
          ' + ' + el.to_s
        else
          el.to_s 
        end
      end
    end

    def convert_exponent(el)
      case el
      when 0
        ''
      else
        'x^' + el.to_s
      end
    end
  end
end
