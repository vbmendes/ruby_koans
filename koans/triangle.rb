# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

class Triangle < Object
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  
  def equal_sides
    ret = 0
    ret += 1 if @a == @b
    ret += 1 if @a == @c
    ret += 1 if @b == @c
    ret
  end
  
  def type
    [:scalene, :isosceles, nil, :equilateral][self.equal_sides]
  end
  
  def valid?
    if @a <= 0 or @b <= 0 or @c <= 0:
    raise TriangleError, "All sides  must be greather than 0."
    end
    if @a <= (@b - @c).abs or @a >= @b + @c
      raise TriangleError, "Invalid triangle"
    end
    true
  end
  
end

def triangle(a, b, c)
  t = Triangle.new(a, b, c)
  if t.valid?
    t.type
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
