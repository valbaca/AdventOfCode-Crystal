module Advent
  class Day03
    def self.part1(input)
      in = input.to_i
      ring = 0
      square = (ring+1)**2
      max_offset = 0
      steps = 0
      curr_offset = 0
      increasing = false
      in.times do |i|
        next if i == 0
        puts "i=#{i} steps=#{steps}"
        if i == square
          #puts "going out"
          ring += 1
          square = (ring*2+1)**2
          max_offset += 1
          curr_offset = max_offset - 1
          increasing = false
          steps += 1
        else
          if curr_offset > 0 && curr_offset < max_offset
            if increasing
              #puts "going up"
              curr_offset += 1
              steps += 1
            else
              #puts "going down"
              curr_offset -= 1
              steps -= 1
            end
          elsif curr_offset == 0
            #puts "was 0, going up"
            curr_offset = 1
            increasing = true
            steps += 1
          else
            #puts "was max, going down"
            curr_offset -= 1
            increasing = false
            steps -= 1
          end
        end
      end
      steps
    end
  end
end
