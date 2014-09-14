module SupremeMath
  class Term

    TERM_REGEX = /([\+-]?\s*\(*-?\d*[\/\.]*\d*\)*[a-z] \^? -?\(?\d*\/?\d*\)?) | ([\+-]? \s* \(*\d*[\/\.]*\d*\)*)/ix
    
    def self.parse(input)
      captures = TERM_REGEX.match(input).captures
      if captures[0].nil?
        SupremeMath::Constant.new(captures[1]) 
      else
        SupremeMath::Variable.new(captures[0])
      end
    end

  end
end
