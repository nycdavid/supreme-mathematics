class QuadraticEquation
  attr_accessor :first_root, :second_root, :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
    solve
  end

  def solve
    outside_of_root = -@b
    inside_of_root = Math.sqrt((@b)**2 - 4*@a*@c)
    denominator = 2 * @a
    find_roots(outside_of_root, inside_of_root, denominator)
  end

  private
    def find_roots(outer, inner, denominator)
      @first_root = plus_route(outer, inner, denominator)
      @second_root = minus_route(outer, inner, denominator)
    end

    def plus_route(outer, inner, denom)
      result = (outer + inner) / denom
      result.to_r.denominator === 1 ? result.to_i : result.to_r
    end
    
    def minus_route(outer, inner, denom)
      result = (outer - inner) / denom
      result.to_r.denominator === 1 ? result.to_i : result.to_r
    end
end
