require "./Day01"
require "./Day02"
require "./Day03"
require "./Day04"
require "./Day05"
# Advent is made up of solutions for Advent of Code to learn Crystal
#
# See https://adventofcode.com
module Advent
  extend self
  VERSION = "0.1.0"
  puts "Advent 2017"
  #TODO get the day from input: Advent -d 1 # or do nothing

  d01_input = File.read_lines("input/d01p1.txt")[0]
  puts "Day 01:"
  puts Advent::Day01.part1(d01_input)
  puts Advent::Day01.part2(d01_input)

  d02_input = File.read_lines("input/d02p1.txt")
  puts "Day 02:"
  puts Advent::Day02.part1(d02_input)
  puts Advent::Day02.part2(d02_input)

  puts "Day 03:"
  puts Advent::Day03.part1(325489+1)
  puts Advent::Day03.part2(325489)

  puts "Day 04:"
  d04_input = File.read_lines("input/d04.txt")
  puts Advent::Day04.part1(d04_input)
  puts Advent::Day04.part2(d04_input)
  
  puts "Day 05:"
  d05_input = File.read_lines("input/d05.txt")
  puts Advent::Day05.part1(d05_input)
end
