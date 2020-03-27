# TIL: careful which operations are mutating and which output a new object
# Also, obviously, look at the return type of method (may not be obvs)
# like, arrays vs iterators
# use // for "integer" division (truncates)
# careful with parens, like input.split "".map &.to_i doesn't work
# but input.split("").map &.to_i does
module Advent
  class Day01
    def self.part1(input)
      arr = input.split("").map &.to_i
      sum = 0
      arr.each_with_index do |elem, index|
        nxt = arr[(index+1) % arr.size]
        sum += elem if elem == nxt
      end
      sum
    end
    def self.part2(input)
      arr = input.split("").map &.to_i
      sum = 0
      offset = arr.size // 2
      arr.each_with_index do |elem, index|
        nxt = arr[(index+offset) % arr.size]
        sum += elem if elem == nxt
      end
      sum
    end
  end
end
