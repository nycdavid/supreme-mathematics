require 'pry'

class Polynomial
  attr_reader :elements, :string

  def initialize(string)
    @string = string
    @elements = string.split(/(\+|\-)/)
    @elements.delete('')
    map_elements
  end

  private
    def map_elements
      arr = []
      @elements.reverse.each_slice(2) do |a|
        if a.count === 2
          arr << a.reverse.join.gsub(/\s+/, '')
        else
          arr << a.first.gsub(/\s+/, '')
        end
      end

      @elements = arr.reverse.map! { |element| { coefficient: coefficient_of(element), exponent: exponent_of(element) } }
    end

    def coefficient_of(el)
      if el.strip.match /[a-z]/
        case el.strip.match(/[a-z]/).pre_match.strip
        when '-'
          -1
        when ''
          1
        else
          el.strip.match(/[a-z]/).pre_match.to_i
        end
      else
        el.to_i
      end
    end

    def exponent_of(el)
      if el.strip.match /[a-z]/
        el.strip.match(/[a-z]/).post_match === '' ? 1 : el.strip.match(/[a-z]/).post_match.gsub('^', '').to_i
      else
        0
      end
    end

end
