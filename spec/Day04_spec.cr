require "spec"
require "../src/Day04"

describe Advent::Day04 do
  it "Day 4: passcodes" do
    Advent::Day04.part1(["aa bb cc dd ee"]).should eq(1)
    Advent::Day04.part1(["aa bb cc dd aa"]).should eq(0)
    Advent::Day04.part1(["aa bb cc dd aaa"]).should eq(1)
  end

  it "Day 4: secure passcodes" do
    Advent::Day04.part2(["abcde fghij"]).should eq(1)
    Advent::Day04.part2(["abcde xyz ecdab"]).should eq(0)
    Advent::Day04.part2(["a ab abc abd abf abj"]).should eq(1)
    Advent::Day04.part2(["iiii oiii ooii oooi oooo"]).should eq(1)
    Advent::Day04.part2(["oiii ioii iioi iiio"]).should eq(0)
  end
end
