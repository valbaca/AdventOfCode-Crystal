# TIL: This was a challenging problem. There has to be another way

# The nil checks on ivars is very annoying, but perhaps it's more clear
# than other langs where race-conditions could be hiding

# Again, still blown away by Crystal's speed
# My solution isn't well optimized, but still executes fast
module Advent
  class Day03

    def self.part1(input)
      in = input.to_i
      ring = 0
      square = (ring+1)**2
      max_offset = 0
      steps = 0
      curr_offset = 0
      increasing = false
      in.times do |i|
        next if i == 0
        #puts "i=#{i} steps=#{steps}"
        if i == square
          #puts "going out"
          ring += 1
          square = (ring*2+1)**2
          max_offset += 1
          curr_offset = max_offset - 1
          increasing = false
          steps += 1
        else
          if curr_offset > 0 && curr_offset < max_offset
            if increasing
              #puts "going up"
              curr_offset += 1
              steps += 1
            else
              #puts "going down"
              curr_offset -= 1
              steps -= 1
            end
          elsif curr_offset == 0
            #puts "was 0, going up"
            curr_offset = 1
            increasing = true
            steps += 1
          else
            #puts "was max, going down"
            curr_offset -= 1
            increasing = false
            steps -= 1
          end
        end
      end
      steps
    end

    ###################################################
    # Part 2

    class Node
      property value, up, right, down, left
      getter pos
      def initialize(
        @pos : Int32,
        @value : Int32 = 0, 
        @up : Node? = nil,
        @right : Node? = nil,
        @down : Node? = nil,
        @left : Node? = nil)
      end

      def to_s(io : IO)
        io << "Node {pos=#{@pos} value=#{@value} u=#{!@up.nil?} r=#{!@right.nil?} d=#{!@down.nil?} l=#{!@left.nil?}}"
      end

      def connect(other : Node)
        # base case
        if @up.nil? && @right.nil? && @down.nil? && left.nil?
         #puts "base case"
          self.right = other
          other.left = self
          return
        end
        # up => right => down => left => up
        if !@up.nil? && @right.nil?
         #puts "go right"
          self.right = other
          other.left = self # reflect
          return unless up = @up # dumb nil check
          diag = up.right
          if !diag.nil? 
           #puts "go right, connect up"
            diag.down = other
            other.up = diag
          end
        elsif !@right.nil? && @down.nil? 
         #puts "go down"
          self.down = other
          other.up = self
          return unless right = @right
          diag = right.down 
          if !diag.nil?
           #puts "go down, connect right"
            diag.left = other
            other.right = diag
          end
        elsif !@down.nil? && @left.nil? 
          #puts "go left"
          self.left = other
          other.right = self
          return unless down = @down
          diag = down.left 
          if !diag.nil?
            #puts "go left, connect down"
            diag.up = other
            other.down = diag
          end
        elsif !@left.nil? && @up.nil? 
          #puts "go up"
          self.up = other
          other.down = self
          return unless left = @left
          diag = left.up
          if !diag.nil?
            #puts "go up, look left"
            diag.right = other
            other.left = diag
          end
        end #if
      end # connect

      def calc_value
        sum = 0
        if up = @up
          sum += up.value
          if r = up.right
            sum += r.value 
          end
        end
        if right = @right
          sum += right.value
          if d = right.down
            sum += d.value
          end
        end

        if down = @down
          sum += down.value
          if l = down.left
            sum += l.value
          end
        end
        if left = @left
          sum += left.value
          if u = left.up
            sum += u.value
          end
        end
        self.value = sum
      end # calc_value
    end # Node

    def self.part2test(input)
      in = input.to_i
      cur = Node.new(1, 1)
      (in-1).times do |_|
        #puts "cur=#{cur}"
        nxt = Node.new(cur.pos+1, 0)
        cur.connect(nxt)
        nxt.calc_value
        cur = nxt
      end # while
      #puts "cur=#{cur}"
      cur.value
    end

    def self.part2(input : Int32)
      # want first value that's larger than input
      cur = Node.new(1, 1)
      while cur.value < input
        nxt = Node.new(cur.pos+1, 0)
        cur.connect(nxt)
        nxt.calc_value
        cur = nxt
      end
      cur
    end
  end
end
