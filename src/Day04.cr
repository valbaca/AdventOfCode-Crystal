module Advent
  class Day04
    def self.part1(input)
      sum = 0
      input.each do |line|
        words = line.split(/\s/)
        word_set = words.to_set
        sum += 1 if words.size == word_set.size
      end
      sum
    end

    def self.part2(input)
      sum = 0
      input.each do |line|
        words = line.split(/\s/)
        dedupe_words = words.map {|word| word.chars.sort.join }.to_set
        sum += 1 if words.size == dedupe_words.size
      end
      sum
    end
  end
end
