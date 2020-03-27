require "spec"
require "../src/Day01"

describe Advent::Day01 do
  it "Day 1, part 1: sum matching digits" do
    Advent::Day01.part1("1122").should eq(3)
    Advent::Day01.part1("1111").should eq(4)
    Advent::Day01.part1("1234").should eq(0)
    Advent::Day01.part1("91212129").should eq(9)
  end

  it "Day 1, part 2: sum digits half-way" do
    Advent::Day01.part2("1212").should eq(6)
    Advent::Day01.part2("1221").should eq(0)
    Advent::Day01.part2("123425").should eq(4)
    Advent::Day01.part2("123123").should eq(12)
    Advent::Day01.part2("12131415").should eq(4)
  end
end
