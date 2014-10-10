module Function
  class Expression < Treetop::Runtime::SyntaxNode
    def evaluate
      elements.map { |element| element.value }.inject(0) { |result, element| result + element }
    end
  end
end
