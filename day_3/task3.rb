class SkiSlope
  attr_reader :unseen_slope
  def initialize
    @file = File.open("slope.txt", "r").map(&:chomp)
    slope_length = %x{wc -l "slope.txt"}.split[0].to_i
    @unseen_slope = @file.map { |line| line * slope_length }
    @slope = 0
  end

  def tree_counter(right, down)
    trees = 0
    position = 0

    unseen_slope.each do |line|
      if @slope % down == 0
        if line[position] == "#"
          trees += 1
        end
        position += right
      end
      @slope += 1
    end
    trees
  end
end

blue = SkiSlope.new.tree_counter(3,1)
red = SkiSlope.new.tree_counter(1,1)
green = SkiSlope.new.tree_counter(5,1)
crosscountry = SkiSlope.new.tree_counter(7,1)
black = SkiSlope.new.tree_counter(1,2)

puts "I hit #{blue} trees while skiing"

puts "I hit #{blue*red*green*crosscountry*black} while on my ski trip"
