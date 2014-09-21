module Numerics
  class Treetop::Runtime::SyntaxNode
    def stripped_text_value 
      text_value.gsub(/\s+/, '')
    end
  end

  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def value
      stripped_text_value.to_i
    end
  end

  class DecimalLiteral < Treetop::Runtime::SyntaxNode
    def value
      stripped_text_value.to_f
    end
  end

  class RationalLiteral < Treetop::Runtime::SyntaxNode
    def value
      stripped_text_value.to_r
    end
  end
end
