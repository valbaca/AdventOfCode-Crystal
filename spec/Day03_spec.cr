require "spec"
require "../src/Day03"

describe Advent::Day03 do
  it "Day 3: Sprial Memory" do
    Advent::Day03.part1("1").should eq(0)
    Advent::Day03.part1("12").should eq(3)
    Advent::Day03.part1("23").should eq(2)
    Advent::Day03.part1("1024").should eq(31)
  end
end
