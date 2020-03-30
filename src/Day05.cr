# TIL: crystal run -t <file.cr> will add runtime info
# so I don't have to write my own "elapsed_time"
# TIL: the --release flag is *REAL*, take a lot longer to compile but makes runtime even faster!
# with --release: compile time was ~17s, runtime is 98ms
# w/o --release: compile time was 1.3s, runtime is 1841ms
module Advent
  class Day05
    # input is array of strings
    def self.part1(input)
      jumps = input.map &.to_i
      i = 0
      steps = 0
      range = (0...jumps.size)
      while range.includes? i
        jump = jumps[i]
        jumps[i] += 1
        i += jump
        steps += 1
      end
      steps
    end

    def self.part2(input)
      jumps = input.map &.to_i
      i = 0
      steps = 0
      range = (0...jumps.size)
      while range.includes? i
        jump = jumps[i]
        if jump >= 3
          jumps[i] -= 1
        else
          jumps[i] += 1
        end
        i += jump
        steps += 1
      end
      steps
    end
  end
end
