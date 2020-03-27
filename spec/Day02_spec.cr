require "spec"
require "../src/Day02"

describe Advent::Day02 do
  it "Day 2, part 1: checksum spreadsheet" do
    Advent::Day02.part1(["5 1 9 5"]).should eq(8)
    Advent::Day02.part1(["5 1 9 5",
                         "7 5 3",
                         "2 4 6 8"]).should eq(18)
  end
end

