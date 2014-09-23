module Numerics
  class Treetop::Runtime::SyntaxNode
    def stripped_text_value 
      text_value.gsub(/\s+/, '').gsub(/\)/, '').gsub(/\(/, '')
    end
  end
  
  class Constant < Treetop::Runtime::SyntaxNode
  end

  class OperatorLiteral < Constant
    def value
      elements.find { |element| element.is_a? Numerics::Constant }.value
    end
  end

  class IntegerLiteral < Constant
    def value
      stripped_text_value.to_i
    end
  end

  class DecimalLiteral < Constant
    def value
      stripped_text_value.to_f
    end
  end

  class RationalLiteral < Constant
    def value
      stripped_text_value.to_r
    end
  end

  class Expression < Treetop::Runtime::SyntaxNode
    def evaluate
      elements.select { |element| element.is_a? Numerics::Constant }
              .map { |element| element.value }
              .inject(:+)
    end
  end
end

module Polynomial
  class LinearFunction < Treetop::Runtime::SyntaxNode
  end

  class Slope < Treetop::Runtime::SyntaxNode
    def value
      elements.find { |element| element.is_a? Numerics::Constant }
              .value
    end
  end

  class Variable < Treetop::Runtime::SyntaxNode
  end
end
