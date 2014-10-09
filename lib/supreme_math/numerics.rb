module Numerics
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def value
      clean_text_value.to_i
    end

    private
      def clean_text_value
        text_value.gsub(/\s+/, '')
      end
  end
end
