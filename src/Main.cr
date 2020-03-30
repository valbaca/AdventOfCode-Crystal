require "./*"
require "option_parser"

# Advent is made up of solutions for Advent of Code to learn Crystal
#
# See https://adventofcode.com
module Main
  VERSION = "0.1.0"
  puts "Advent 2017"

  all_days = true
  day = 0
  option_parser = OptionParser.parse do |parser|
    parser.banner = "Advent 2017"

    parser.on "-h", "--help", "Show help" do
      puts parser
      exit
    end

    parser.on "-d DAY", "--day=DAY", "Run the code for a day" do |d|
      all_days = false
      day = d.to_i
      if day < 1
        exit(1)
      elsif day > LAST_DAY_SOLVED # defined at end of file
        STDERR.puts "Only have solutions up to Day #{LAST_DAY_SOLVED}"
        exit(1)
      end
    end
  end

  if all_days || day == 1
    d01_input = File.read_lines("input/d01p1.txt")[0]
    puts "Day 01:"
    puts Advent::Day01.part1(d01_input)
    puts Advent::Day01.part2(d01_input)
  end

  if all_days || day == 2
    d02_input = File.read_lines("input/d02p1.txt")
    puts "Day 02:"
    puts Advent::Day02.part1(d02_input)
    puts Advent::Day02.part2(d02_input)
  end

  if all_days || day == 3
    puts "Day 03:"
    puts Advent::Day03.part1(325489 + 1)
    puts Advent::Day03.part2(325489)
  end

  if all_days || day == 4
    puts "Day 04:"
    d04_input = File.read_lines("input/d04.txt")
    puts Advent::Day04.part1(d04_input)
    puts Advent::Day04.part2(d04_input)
  end

  if all_days || day == 5
    puts "Day 05:"
    d05_input = File.read_lines("input/d05.txt")
    puts Advent::Day05.part1(d05_input)
    puts Advent::Day05.part2(d05_input)
  end
  LAST_DAY_SOLVED = 5 #TODO Update me on each new solution
end
