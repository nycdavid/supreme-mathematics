class Polynomial
  attr_reader :elements

  def initialize(string)
    @elements = string.split(/\+|\-/)
    map_elements
  end


  private
    def map_elements
      @elements.map! { |element| { coefficient: coefficient_of(element), exponent: exponent_of(element) } }
    end

    def coefficient_of(el)
      el.strip.gsub(/[a-z]\^\d/, '') === '' ? 1 : el.to_i
    end

    def exponent_of(el)
      el.strip.gsub(/[a-z]\^/, '').to_i
    end
end
