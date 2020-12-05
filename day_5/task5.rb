# def with input (ticket)
# binary search tree?


require 'set'

file_path = File.expand_path('planetickets.txt', __dir__)
input     = File.read(file_path)

seats = input.split("\n")

ids = seats.map do |seat|
  row_min, row_max = 0, 127
  column_min, column_max = 0, 7

  seat.split("").each do |c|
    ri = (row_min + row_max) / 2
    ci = (column_min + column_max) / 2

    case c
    when ?F
      row_max = ri
    when ?B
      row_min = ri + 1
    when ?L
      column_max = ci
    when ?R
      column_min = ci + 1
    end
  end

  row_min * 8 + column_min
end

puts ids.max
ids = Set.new(ids)

puts (ids.min..ids.max).find { |id|
  ids.include?(id - 1) && ids.include?(id + 1) && !ids.include?(id)
}
# input = Array.new
# File.readlines('planetickets.txt').each do |line|
#   input << line.strip
# end
#
# row = (0..127).to_a
# col = (0..7).to_a
# output = 0
#
# input.each do |seat|
#   row_id = row.dup
#   col_id = col.dup
#   seat.chars.each do |id|
#     if id == "F"
#       row_id = row_id[0..row_id.length/2 -1]
#     elsif id == "B"
#       row_id = row_id[row_id.length/2..-1]
#     elsif id == "L"
#       col_id = col_id[0..col_id.length/2 -1]
#     elsif id == "R"
#       col_id = col_id[col_id.length/2..-1]
#     end
#   end
#   if row_id[0].to_i * 8 + col_id[0].to_i > output
#     output = row_id[0].to_i * 8 + col_id[0].to_i
#   end
# end
#
# puts output.to_a.sort
# puts "Output: #{output}"

# row * 8 + column = seat number
# DATA = File.readlines('planetickets.txt', chomp: true)
#
# class SeatNumber
#
#   attr_reader :rows, :columns, :plane_rows, :seat_id
#
#   def initialize
#     @rows = rows
#     @columns = columns
#     @plane_rows = (0..127).to_a
#     @seat_id = seat_id
#   end
#
#   def separate_data
#     @rows = DATA[0].chars.slice(0,7)
#     @columns = DATA[0].chars.slice(8,10)
#   end
#
#   def lower_half
#     start_row = @plane_rows[0]
#     end_row = @plane_rows[@plane_rows.length / 2]
#     @plane_rows = @plane_rows.slice(start_row,end_row)
#   end
#
#   def upper_half
#     start_row = @plane_rows.index(@plane_rows[@plane_rows.length / 2])
#     end_row = @plane_rows.last
#     @plane_rows = @plane_rows.slice(start_row,end_row)
#   end
#
# end




#try binary search next
# class Node
#   attr_reader :value
#
#   .split[8]
#   rows = (1..127)
#   columns = (1..7)
#
#   def initialize(letter)
#     @letter = letter
#     @left =nil
#     @right =nil
#
#     if first letter left(0-63) <==> right (64 - 127)
#
#       first letter - find midpoint of array
#       higher or lower? >> (push remaining results into) array2
#       find midpoint of array2
#       higher or lower? (push remaining results into array3)
#       find midpont
# "F" && "L" == left (lower)
# "B" && "R" == right (higher)
#
# end
# end
# puts array
#
# def
