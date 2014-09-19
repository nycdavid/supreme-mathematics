module Numerics
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def value
      text_value.to_i
    end
  end

  class AdditionExpression < Treetop::Runtime::SyntaxNode
    def initialize(*args)
      super
      elements.delete_if { |element| element.class.name == 'Treetop::Runtime::SyntaxNode' }
    end

    def evaluate
      elements.map { |element| element.value }.inject(:+)
    end
  end
end
