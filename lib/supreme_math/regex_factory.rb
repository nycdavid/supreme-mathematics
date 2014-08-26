module SupremeMath
  module RegexFactory

    HEADER = '\A'
    FIRST_REGEX = '(-?\d*\.?\d*[A-Za-z]?\^?\d*)'
    REGEX = '-?\d*\.?\d*[A-Za-z]?\^?\d*)'
    DELIMITER = '\s?([\+-]?\s?'
    FOOTER = '\z'

    def construct
      @operator_count = scan_for_operators
      concat_regex
    end

    def scan_for_operators
      @input.scan(/-?\d*[A-Za-z]?\^?\d*\s?[\+-]\s?-?\d*[A-Za-z]?\^?\d*/).count 
    end

    def concat_regex
      regex_array = [] << FIRST_REGEX
      @operator_count.times do
        regex_array << REGEX
      end
      regex_array = regex_array.join(DELIMITER)
      HEADER + regex_array + FOOTER
    end

  end
end
