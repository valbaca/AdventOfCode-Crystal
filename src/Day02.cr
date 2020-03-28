require "./Elf"

module Advent
  class Day02
    def self.part1(input)
      sum = 0
      input.each do |line|
        ints = line.to_ints
        min = max = ints.first
        ints.each do |i|
          min = i if i < min
          max = i if i > max
        end
        sum += max - min
      end
      sum
    end

    def self.part2(input)
      sum = 0
      input.each do |line|
        ints = line.to_ints.sort
        quotient = 0
        ints.each_with_index do |e, i|
          others = ints[i+1..]
          others.each do |other|
            if other % e == 0
              quotient = other // e
            end
          end
        end
        # sort & find quot between even divisors
        sum += quotient
      end
      sum
    end
  end
end
