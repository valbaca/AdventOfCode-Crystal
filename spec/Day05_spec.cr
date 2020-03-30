require "spec"
require "../src/Day05"

describe Advent::Day05 do
  it "Day 5: jumps" do
    Advent::Day05.part1(["0", "3", "0", "1", "-3"]).should eq(5)
  end
end
