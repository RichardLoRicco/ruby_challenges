=begin

INPUT: three sides of a triangle, consisitng of integers
RETURN: a string denoting the type of triangle
  - options:
    1) equilateral
    2) isosceles
    3) scalene

RULES:
- how to determine type:
  1) equilateral -> all three sides are same length
  2) isosceles -> exactly two sides have the same length
  3) scalene -> all sides have different lengths
- in order to be a triangle at all:
  -  all sides must have a length > 0; and
  - sum of the lengths of any 2 sides must be greater than length of the third side

---


ALGORITHM:
initialize:
  - initialize @sorted_sizeds to array of sorted sides
  - raise ArgumentError if any side's length is < 0
  - raise ArgumentError if sum of lengths of any 2 sides is <= length of third side
  - ininitialize instance variables and assign each parameter to them
    - @first 
    - @second
    - @third

KIND
  - return `equilateral` if @first, @second, and @third are equal
  - return `isosceles` if @first and @second or @second and @third are equal
  - return `scalene`

=end

class Triangle
  attr_reader :first, :second, :third

  def initialize(side1, side2, side3)
    sorted_sides = [side1, side2, side3].sort
    @first = sorted_sides.first
    @second = sorted_sides[1]
    @third = sorted_sides.last

    raise ArgumentError.new if side_less_than_zero? || fails_side_sum?
  end

  def side_less_than_zero?
    first <= 0 || second <= 0 || third <= 0
  end

  def fails_side_sum?
    first + second <= third 
  end

  def kind
    if first == second && second == third
      'equilateral' 
    elsif first == second || second == third
      'isosceles' 
    else
      'scalene'
    end
  end
end

triangle1 = Triangle.new(2, 3, 4)
p triangle1.kind