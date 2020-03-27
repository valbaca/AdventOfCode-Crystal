module Advent
  class Day02
    def self.part1(input)
      sum = 0
      input.each do |line|
        ints = line.split(/\s/).map &.to_i
        min = max = ints.first
        ints.each do |i|
          min = i if i < min
          max = i if i > max
        end
        sum += max - min
      end
      sum
    end
  end
end
