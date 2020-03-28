# Elf is a collection of helper functions, like Santa's elves!
class Elf
end

################################################################################
# Monkey patching
class String
  # Converts the string to an array of ints, like "1 23 456" => [1, 23, 456]
  # re: regex to split on, whitespace by default
  def to_ints(re=/\s/)
    self.split(re).map &.to_i
  end
end
