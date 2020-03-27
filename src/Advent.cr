require "./Day01"
require "./Day02"
# Advent is made up of solutions for Advent of Code to learn Crystal
#
# See https://adventofcode.com
module Advent
  extend self
  VERSION = "0.1.0"
  puts "Advent 2017"
  #TODO get the day from input: Advent -d 1 # or do nothing

  d01_input = File.read_lines("input/d01p1.txt")[0]
  puts "Day 01, part 1:"
  puts Advent::Day01.part1(d01_input)
  puts "Day 01, part 2:"
  puts Advent::Day01.part2(d01_input)

  d02_input = File.read_lines("input/d02p1.txt")
  puts "Day 02, part 1:"
  puts Advent::Day02.part1(d02_input)

end
