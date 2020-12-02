def findexpenses
  File.open("input.txt", "r") do |file|
    expenses = file.to_a
    expenses.combination(2).select {|a, b| (a + b == 2020)}
  end
end

puts findexpenses

array = "g:"

p array[0...-1]
