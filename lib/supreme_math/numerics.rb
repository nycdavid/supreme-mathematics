module Numerics
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def value
      clean_text_value.to_i
    end
  end

  class DecimalLiteral < Treetop::Runtime::SyntaxNode
    def value
      clean_text_value.to_f
    end
  end

  class RationalLiteral < Treetop::Runtime::SyntaxNode
    def value
      clean_text_value.to_r
    end
  end
end

class Treetop::Runtime::SyntaxNode
  def clean_text_value
    text_value.gsub(/\(/, '').gsub(/\)/, '').gsub(/\s+/, '')
  end
end
