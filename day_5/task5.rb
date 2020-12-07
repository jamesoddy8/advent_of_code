# def with input (ticket)
# binary search tree?
require 'set'

file_path = File.expand_path('planetickets.txt')
input = File.read(file_path)

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

puts ids.max # fist answer
ids = Set.new(ids)

puts (ids.min..ids.max).find { |id|
  ids.include?(id - 1) && ids.include?(id + 1) && !ids.include?(id)
} # second answer
